require "csv"
 
puts "1(新規でメモを作成) 2(既存のメモを編集する) 3(メモアプリを終了する)"

memo_type = gets.to_s.chomp #getsで値を取得して、memo_typeに代入
input_number = memo_type.chomp; #input_numberに取得した値を代入。chompで末尾の改行を削除。

if input_number === "1";

    puts "拡張子を除いた新規ファイル名を入力してください(ファイルが既に存在する場合は、内容が追記されます)";

    file_name = gets.chomp; #入力されたファイル名を取得してfile_nameに代入

    puts "メモの内容を入力してください。入力が終わったらCtrl+Dを押してください。";

    input_memo = STDIN.read; #STDINで複数行の内容を取得可能
    memo = input_memo.chomp; #更にinput_memoの内容をmemoに代入。Enterで保存されないようにchompで末尾の改行コードを削除。

    CSV.open("#{file_name}.csv" , "a+") do |csv| #12行目で取得したファイル名を使ってCSVファイルを作成
    csv.puts ["#{memo}"]; #putsで書き込みができる

end #CSV.openに対するend

elsif input_number === "2";

    puts "既存のメモを編集します。";

    loop do

    puts "拡張子を除いた既存ファイル名を入力してください。"
    file_name = gets.chomp;
    read_memo = CSV.open("#{file_name}.csv" , "a+");
    puts read_memo.read;

    puts "このファイルに追記ができます。追記しますか？"
    puts "1(はい)2(いいえ)3(メモアプリを終了する)"

    choice_type = gets.to_s.chomp;
    choice_number = choice_type.chomp;

        if choice_number === "1";

            puts "追記する内容を入力してください";
            puts "Ctrl+Dで保存+ファイル選択に戻ります"

            choice_memo = STDIN.read; #STADINで複数行の内容を取得可能
            memo = choice_memo.chomp;

            CSV.open("#{file_name}.csv" , "a+") do |csv|;
            csv.puts ["#{memo}"];
            end

        elsif choice_number === "2"

            puts "既存のファイル名をもう一度入力してください";

        elsif choice_number === "3"

            puts "メモアプリを終了します"

            break if choice_number === "3"
        
        else

            puts "指定された数字の入力が確認できません"
            puts "もう一度ファイル名を入力してください"
        
        
        end
        end

elsif input_number === "3";
    puts "メモアプリを終了します。";
    exit!

else
    puts "指定された数字を入力してください";
    return
end

