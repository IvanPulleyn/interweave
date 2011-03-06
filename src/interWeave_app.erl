%% @author Mochi Media <dev@mochimedia.com>
%% @copyright interWeave Mochi Media <dev@mochimedia.com>

%% @doc Callbacks for the interWeave application.

-module(interWeave_app).
-author("Mochi Media <dev@mochimedia.com>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for interWeave.
start(_Type, _StartArgs) ->
    interWeave_deps:ensure(),
    interWeave_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for interWeave.
stop(_State) ->
    ok.
