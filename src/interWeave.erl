%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc interWeave.

-module(interWeave).
-author("Mochi Media <dev@mochimedia.com>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the interWeave server.
start() ->
    interWeave_deps:ensure(),
    ensure_started(crypto),
    ensure_started(mnesia),
    application:start(interWeave).


%% @spec stop() -> ok
%% @doc Stop the interWeave server.
stop() ->
    application:stop(interWeave),
    application:stop(mnesia).
