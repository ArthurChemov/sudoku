class SudokuTaskController < ApplicationController
  attr_reader :sudoku_array
  def index
    @sudoku_task
  end

  def new
    @sudoku_task = SudokuTask.new
    @sudoku_array = generate_sudoku  # має згенерувати готовий судоку
    puts "Here's the Sudoku array:" # це для тестування
    puts @sudoku_array.inspect       # і це
  end

  def create
    sudoku_task = SudokuTask.new(sudoku_params)

    if sudoku_task.save
      @solution = solve(sudoku_task)
      puts sudoku_task
      redirect_to result_path
    else
      @sudoku_task = sudoku_task
      render :new
    end
  end

  def result
  end

  class SudokuSolver
    SIZE = 9
    NUMBERS = (1..9).to_a

    def initialize
      @board = Array.new(SIZE) { Array.new(SIZE, nil) }
      rand_count = 0  # зміна для підрахунку, скільки чисел вже внесено до порожньої судоку
      max_on_board = 30 # буде внесено не більше цієї кількості разів
      for i in 0..8 do
        for j in 0..8 do
          if rand_count <= max_on_board and rand(0..1) == 1   # якщо ще дозволено вносити числа на початку та рандом
          @sudoku_task[i][j] = @sudoku_array[i][j]  # отут треба щоб воно брало відвовідне число із вже заповненого судоку
          rand_count += 1
          end
        end
      end
      puts "Here's the Board array:" # тест
      puts @board.inspect       # знову тест
    end

    def [](x, y)
      @board[y][x]
    end

    def []=(x, y, value)
      raise "#{value} is not allowed in the row #{y}" unless allowed_in_row(y).include?(value)
      raise "#{value} is not allowed in the column #{x}" unless allowed_in_column(x).include?(value)
      raise "#{value} is not allowed in the square at #{x}, #{y}" unless allowed_in_square(x, y).include?(value)
      @board[y][x] = value
    end

    def to_s
      @board.map { |row| row.map { |x| if x.nil?; '-'; else x end }.join(' ') }.join("\n")
    end

    def row(y)
      Array.new(@board[y])
    end

    def column(x)
      @board.map { |row| row[x] }
    end

    def allowed_in_row(y)
      (NUMBERS - row(y)).uniq << nil
    end

    def allowed_in_column(x)
      (NUMBERS - column(x)).uniq << nil
    end

    def allowed_in_square(x, y)
      sx = 3 * (x / 3)
      sy = 3 * (y / 3)
      square = []

      3.times do |i|
        3.times do |j|
          square << @board[sy + j][sx + i]
        end
      end

      (NUMBERS - square).uniq << nil
    end

    def allowed(x, y)
      allowed_in_row(y) & allowed_in_column(x) & allowed_in_square(x, y)
    end

    def empty
      result = []

      9.times do |y|
        9.times do |x|
          result << [x, y] if self[x, y].nil?
        end
      end

      result
    end

    def solved?
      empty.empty?
    end
  end

  def solve(sudoku_task)
    solver = SudokuSolver.new
    (0..8).each do |i|
      (0..8).each do |j|
        solver[j, i] = sudoku_task.public_send("cell_#{i}_#{j}")
      end
    end
    puts solver.to_s
    return true if solver.solved?

    x, y = solver.empty.first
    allowed = solver.allowed(x, y).compact

    until !allowed.empty?
      solver[x, y] = allowed.shift

      begin
        puts solver.to_s
        return true if solve(solver)
      rescue Exception => e
      end

      solver[x, y] = nil
    end
  end

  private

  def sudoku_params
    params.require(:sudoku_task).permit(
      :cell_0_0, :cell_0_1, :cell_0_2, :cell_0_3, :cell_0_4, :cell_0_5, :cell_0_6, :cell_0_7, :cell_0_8,
      :cell_1_0, :cell_1_1, :cell_1_2, :cell_1_3, :cell_1_4, :cell_1_5, :cell_1_6, :cell_1_7, :cell_1_8,
      :cell_2_0, :cell_2_1, :cell_2_2, :cell_2_3, :cell_2_4, :cell_2_5, :cell_2_6, :cell_2_7, :cell_2_8,
      :cell_3_0, :cell_3_1, :cell_3_2, :cell_3_3, :cell_3_4, :cell_3_5, :cell_3_6, :cell_3_7, :cell_3_8,
      :cell_4_0, :cell_4_1, :cell_4_2, :cell_4_3, :cell_4_4, :cell_4_5, :cell_4_6, :cell_4_7, :cell_4_8,
      :cell_5_0, :cell_5_1, :cell_5_2, :cell_5_3, :cell_5_4, :cell_5_5, :cell_5_6, :cell_5_7, :cell_5_8,
      :cell_6_0, :cell_6_1, :cell_6_2, :cell_6_3, :cell_6_4, :cell_6_5, :cell_6_6, :cell_6_7, :cell_6_8,
      :cell_7_0, :cell_7_1, :cell_7_2, :cell_7_3, :cell_7_4, :cell_7_5, :cell_7_6, :cell_7_7, :cell_7_8,
      :cell_8_0, :cell_8_1, :cell_8_2, :cell_8_3, :cell_8_4, :cell_8_5, :cell_8_6, :cell_8_7, :cell_8_8
    ).merge(created_at: Time.now, updated_at: Time.now)
  end

  def generate_sudoku
    # Create an empty 9x9 matrix for the sudoku
    sudoku = Array.new(9) { Array.new(9, 0) }

    # Fill the first 3x3 squares of the sudoku with random numbers from 1 to 9
    for i in 0..2
      for j in 0..2
        num = rand(1..9)
        while !is_valid(sudoku, i, j, num)
          num = rand(1..9)
        end
        sudoku[i][j] = num
      end
    end

    # Fill the rest of the sudoku using the recursive function solve_sudoku()
    solve_sudoku(sudoku, 0, 3)

    return sudoku
  end

  def is_valid(sudoku, row, col, num)
    # Check if the number is already in the row
    return false if sudoku[row].include?(num)

    # Check if the number is already in the column
    return false if sudoku.transpose[col].include?(num)

    # Check if the number is already in the 3x3 square
    row_start = (row / 3) * 3
    col_start = (col / 3) * 3
    for i in row_start..(row_start + 2)
      for j in col_start..(col_start + 2)
        return false if sudoku[i][j] == num
      end
    end

    # If the number is not found in the row, column or square, it is valid
    return true
  end

  def solve_sudoku(sudoku, row, col)
    # If we have reached the last column of the last row, the sudoku is solved
    return true if row == 9

    # If the current cell is not empty, move to the next cell
    if sudoku[row][col] != 0
      if col == 8
        return solve_sudoku(sudoku, row + 1, 0)
      else
        return solve_sudoku(sudoku, row, col + 1)
      end
    end

    # Try placing each number from 1 to 9 in the current cell
    for num in 1..9
      if is_valid(sudoku, row, col, num)
        sudoku[row][col] = num

        # Move to the next cell
        if col == 8
          return true if solve_sudoku(sudoku, row + 1, 0)
        else
          return true if solve_sudoku(sudoku, row, col + 1)
        end

        # If we reach here, it means the current number didn't work. So we reset the cell and try the next number.
        sudoku[row][col] = 0
      end
    end

    # If we reach here, it means no number worked for this cell. So we return false to trigger backtracking.
    return false
  end

end
