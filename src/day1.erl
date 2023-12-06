%% @doc
%% Solves Day 1, Advent of Code.
%%
%% Part 1:  `day1:part1("input.txt").'
%%
%% Part 2:  `day1:part2("input.txt").'
%%
%% @end
-module(day1).
-export([part1/1, part2/1, join_first_and_last_digit/2, get_numbers_inverse/2]).

%% @doc
%% Reads an input file containing lines of binary data, detecting the first and
%% last digit in each line and summing all the lines.
%%
%% Applies a criteria to detect digits in each line. The criteria considers a
%% digit to be either a character between `1' and `9'. It then joins the
%% first and last digits detected using the function
%% `join_first_and_last_digit/2' and sums all these elements to obtain a result.
%% @end
-spec part1(SRC :: binary()) -> integer().
part1(SRC) -> part(SRC, fun criteria1/1).

%% @doc
%% Reads an input file containing lines of binary data, detecting the first and
%% last digit in each line and summing all the lines.
%%
%% Applies a criteria to detect digits in each line. The criteria considers a
%% digit to be either a character between `1' and `9' or the written number
%% `one' through `nine'. It then joins the first and last digits detected
%% using the function `join_first_and_last_digit/2' and sums all these elements
%% to obtain a result.
%% @end
-spec part2(SRC :: binary()) -> integer().
part2(SRC) -> part(SRC, fun criteria2/1).

part(SRC, Criteria) ->
    {ok, Data} = file:read_file(SRC),
    Lines = binary:split(Data, <<"\n">>, [global]),
    lists:foldl(
        fun(Line, Acc) -> join_first_and_last_digit(Criteria, Line) + Acc end,
        0,
        Lines
    ).

%% @doc
%% Concatenates the first and last digits detected in the binary `Line'. If
%% there is only one element, it joins with itself. In the absence of digits, it
%% counts as 0.
%% @end
-spec join_first_and_last_digit(Criteria, Line) -> Result when
    Criteria :: fun((binary()) -> {integer(), binary()}),
    Line     :: binary(),
    Result   :: integer().
join_first_and_last_digit(Criteria, Line) ->
    Numbers = get_numbers_inverse(Criteria, Line),
    case Numbers of
        [] -> 0;
        [First] -> First * 10 + First;
        [Last | TailNumbers ] -> Last + lists:last(TailNumbers) * 10
    end.

%% @doc
%% Returns a list of integers in reverse order. These items are found by
%% applying the `Criteria' function to the binary `Line', which transforms them
%% into integers.
%%
%% @end
-spec get_numbers_inverse(Criteria, Line) -> Result when
    Criteria :: fun((binary()) -> {integer(), binary()}),
    Line     :: binary(),
    Result   :: [integer()] | [].
get_numbers_inverse(Criteria, Line) -> get_numbers_inverse(Criteria, Line, []).

get_numbers_inverse(_, <<>>, List) -> List;

get_numbers_inverse(Criteria,  Line, List) ->
    {Number, Tail} = Criteria(Line),
    get_numbers_inverse(
        Criteria,
        Tail,
        if (Number > 0) -> [Number | List]; true -> List end
    ).

%%-- Internal Functions --------------------------------------------------------

-spec criteria1(Line) -> Result when
    Line   :: binary(),
    Result :: {CurrentNumber :: integer(), LineTail :: binary()}.
criteria1(<<_, Tail/binary>> = Line) ->
    case Line of
        <<Digit, _/binary>>
            when Digit >= $1, Digit =< $9 -> {ascci_to_digit(Digit), Tail};
        <<_, _/binary>>                   -> {0, Tail}
    end.

-spec criteria2(Line) -> Result when
    Line   :: binary(),
    Result :: {CurrentNumber :: integer(), LineTail :: binary()}.
criteria2(<<_, Tail/binary>> = Line) ->
    case Line of
        <<Digit, _/binary>>
            when Digit >= $1, Digit =< $9 -> {ascci_to_digit(Digit), Tail};
        <<"one",   _/binary>>             -> {1, Tail};
        <<"two",   _/binary>>             -> {2, Tail};
        <<"three", _/binary>>             -> {3, Tail};
        <<"four",  _/binary>>             -> {4, Tail};
        <<"five",  _/binary>>             -> {5, Tail};
        <<"six",   _/binary>>             -> {6, Tail};
        <<"seven", _/binary>>             -> {7, Tail};
        <<"eight", _/binary>>             -> {8, Tail};
        <<"nine",  _/binary>>             -> {9, Tail};
        << _,      _/binary>>             -> {0, Tail}
    end.

ascci_to_digit(ASCII) -> ASCII - 48.
