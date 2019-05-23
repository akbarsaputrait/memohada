<?php

namespace App\Http\Middleware;

use Closure;

class ApiAuthentication
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!auth('api')->check()) {
            return response()->json([
                'message' => 'Unauthorized',
            ], 401);
        }

        return $next($request);
    }
}
