<?php

namespace App\Http\Controllers;

use App\Todo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Todo::where('user_id', auth('api')->user()->uuid)->orderBy('id', 'DESC')->get();
        return response()->json([
            'success' => true,
            'data' => $data,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|unique:todos,title,NULL,id,user_id,' . auth('api')->user()->uuid . ',deleted_at,NULL',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $todo = new Todo;
        $todo->title = $request->title;
        $todo->description = $request->description;
        $todo->deadline = date('Y-m-d', strtotime($request->deadline));
        $todo->color = $request->color;
        $todo->user_id = auth('api')->user()->uuid;
        $todo->save();

        return response()->json([
            'success' => true,
            'data' => $todo,
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!Todo::where('id', $id)->exists()) {
            return response()->json([
                'success' => false,
                'data' => null,
            ], 200);

        }

        $data = Todo::where('user_id', auth('api')->user()->uuid)->where('id', $id)->first();
        return response()->json([
            'success' => true,
            'data' => $data,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|unique:todos,title,' . $id . ',id,user_id,' . auth('api')->user()->uuid . ',deleted_at,NULL',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (!Todo::where('id', $id)->exists()) {
            return response()->json([
                'success' => false,
            ], 200);

        }

        $todo = Todo::find($id);
        $todo->title = $request->title;
        $todo->description = $request->description;
        $todo->deadline = date('Y-m-d', strtotime($request->deadline));
        $todo->color = $request->color;
        $todo->user_id = auth('api')->user()->uuid;
        $todo->save();

        return response()->json([
            'success' => true,
            'data' => $todo,
        ], 200);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!Todo::where('id', $id)->exists()) {
            return response()->json([
                'success' => false,
            ], 200);

        }

        Todo::destroy($id);

        return response()->json([
            'success' => true,
        ], 200);
    }
}
