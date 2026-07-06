fun is_older (date1 : int * int * int, date2 : int * int * int) =
    let
	val y1 = #1 date1
	val m1 = #2 date1
	val d1 = #3 date1
	val y2 = #1 date2
	val m2 = #2 date2
	val d2 = #3 date2
    in
	y1 < y2
	orelse (y1 = y2 andalso m1 < m2)
	orelse (y1 = y2 andalso m1 = m2 andalso d1 < d2)
    end

fun number_in_month (dates : (int * int * int) list, month : int) =
    if null dates
    then 0
    else number_in_month(tl(dates), month) + (if #2 (hd(dates)) = month then 1 else 0)
	    
fun number_in_months (dates : (int * int * int) list, months : int list) =
    if null months
    then 0
    else number_in_month(dates, hd(months)) + number_in_months(dates, tl(months))

fun dates_in_month (dates : (int * int * int) list, month : int) =
    if null dates
    then []
    else
	let
	    val d_i_m = dates_in_month(tl(dates), month)
	in
	    if #2 (hd(dates)) = month
	    then hd(dates) :: d_i_m
	    else d_i_m
	end

fun dates_in_months (dates : (int * int * int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd(months)) @ dates_in_months(dates, tl(months))

fun get_nth (string_list : string list, n : int) =
    if n = 1
    then hd string_list
    else get_nth (tl(string_list), n - 1)

fun date_to_string (date : int * int * int) =
    get_nth(["January", "February", "March", "April", "May", "June", "July",
	     "August", "September", "October", "November", "December"], #2 date)
    ^ " "
    ^ Int.toString(#3 date)
    ^ ", "
    ^ Int.toString (#1 date)

fun number_before_reaching_sum (sum : int, numbers : int list) =
    if sum > (hd numbers)
    then number_before_reaching_sum(sum - (hd numbers), (tl numbers)) + 1
    else 0

fun what_month (day : int) =
    let
	val number_of_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(day, number_of_days) + 1
    end

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest (dates : (int * int * int) list) =
    if null dates
    then NONE
    else
	let
	    val last_oldest = oldest(tl dates)
	in
	    if isSome last_oldest andalso is_older(valOf last_oldest, hd dates)
	    then last_oldest
	    else SOME (hd dates)
	end

