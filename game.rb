def main
    while !game_decide() #勝敗決まるまで繰り返す(tureになるまで繰り返す)
    end
end

def game_decide #ゲームの勝敗を決めるメソッド

janken = janken();
if janken == 'draw'; #じゃんけんがあいこの場合にじゃんけんを再戦。勝敗が決まるまで繰り返す。
    puts "あいこで..."
    return false
end

if !hoi_decide() #あっち向いてほいの勝敗決まらなかった場合に再度じゃんけんから
    puts "もう一度じゃんけん..."
    return false #falseで決着がつかなかったことを表す
end

if janken == 'win'; #じゃんけんで勝った状態で、あっち向いてほいの決着がつくとここが作動
    puts "勝った！"
elsif janken == 'lose'; #じゃんけんで勝っていない状態で、あっち向いてほいの決着がつくとここが作動
    puts "負けちゃった！次は勝つぞ！"
end

return true #tureになったので終了(mainメソッドにtureを返すから)
end



def janken(); #ジャンケンメソッド

puts "じゃんけん...";
puts "0(グー)1(チョキ)2(パー)4(戦わない)";

jankens = ['グー','チョキ','パー'];

janken_me = gets.to_i; #人間の手
janken_you = rand(jankens.size); #プログラムの手

puts "ポイ！";

show_choice(jankens[janken_me], jankens[janken_you])

result = 0; #resultの初期値として0をセット
#負け：0,勝ち：1,あいこ：2(人間から見て)

#あいこ
if janken_me == janken_you
    result = 'draw';

#勝ち
elsif ((janken_me == 0 && janken_you == 1) || (janken_me == 1 && janken_you == 2) || (janken_me == 2 && janken_you == 0))
    result == 'win';

#負け
elsif ((janken_me == 0 && janken_you == 2)||(janken_me == 1 && janken_you == 0)||(janken_me == 2 && janken_you == 1))
    result == 'lose';

#戦わない場合は終了
elsif janken_me == 4
    exit
end

return result
end


def hoi_decide
puts "あっち向いて...";
puts "0(上)1(下)2(左)3(右)";

hois = ['上','下','左','右'];

hois_me = gets.to_i;
hois_you = rand(hois.size);

show_choice(hois[hois_me],hois[hois_you]);

return (hois_me == hois_you);
end

def show_choice(choice_me, choice_you) #じゃんけんやあっち向いてホイの結果を表すためのメソッド
    separator = "------------------------"
    puts separator
    puts "あなた：#{choice_me}"
    puts "相手：#{choice_you}"
    puts separator
end


main()
