<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Todolist;
use App\Models\User;
use App\Http\Controllers\Controller;
//use App\Http\Controllers\User;
use Validator;
use Illuminate\Support\Facades\Auth;

class TodolistController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function getTodolist($user_id) {
        return User::find($user_id)->todolist;
    }
    
    /**
     * Show default to do list.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function showTodolist(Request $request) {
        //User::findOrFail( Auth::user()->id );
        $user = auth()->user();
        
        $todolist = new Todolist([
            'planning_language_one' => $request->get('planning_language_one'),
            'planning_language_two' => $request->get('planning_language_two'),
            'planning_language_three' => $request->get('planning_language_three'),
            'planning_document_one' => $request->get('planning_document_one'),
            'planning_document_two' => $request->get('planning_document_two'),
            'planning_document_three' => $request->get('planning_document_three'),
            'planning_bankAccount_one' => $request->get('planning_bankAccount_one'),
            'planning_visa_one' => $request->get('planning_visa_one'),
            'planning_visa_two' => $request->get('planning_visa_two'),
            'planning_anp_one' => $request->get('planning_anp_one'),
            'planning_anp_two' => $request->get('planning_anp_two'),
            'planning_departure_one' => $request->get('planning_departure_one'),
            'planning_departure_two' => $request->get('planning_departure_two'),
        ]);
        
        $todolist->user()->associate($user); // belongsTo relationship between Todolist and User is set here
        $user->todolist()->save($todolist); // hasOne relationship between User and Todolist should be set here
        $todolist = $user->todolist;
        // dump($user->todolist);
        return response()->json([
            'todolist' => [
                'id' => $todolist->id,
                'userId' => $todolist->user_id,
                'languageOne' => $todolist->planning_language_one,
                'languageTwo' => $todolist->planning_language_two,
                'languageThree' => $todolist->planning_language_three,
                'documentOne' => $todolist->planning_document_one,
                'documentTwo' => $todolist->planning_document_two,
                'documentThree' => $todolist->planning_document_three,
                'bankOne' => $todolist->planning_bankAccount_one,
                'visaOne' => $todolist->planning_visa_one,
                'visaTwo' => $todolist->planning_visa_two,
                'anpOne' => $todolist->planning_anp_one,
                'anpTwo' => $todolist->planning_anp_two,
                'depOne' => $todolist->planning_departure_one,
                'depTwo' => $todolist->planning_departure_two,
            ]
            ]);
        /* $user = factory(\App\Models\User::class)->create();
        $todolist = new \App\Models\Todolist();

        $todolist->planning_language_one = '1';
        /* 
        $todolist->planning_language_two = '1';
        $todolist->planning_language_three = '1';
        $todolist->planning_document_one = '1';
        $todolist->planning_document_two = '1';
        $todolist->planning_document_three = '1';
        $todolist->planning_bankAccount_one = '1';
        $todolist->planning_visa_one = '1';
        $todolist->planning_visa_two = '1';
        $todolist->planning_anp_one = '1';
        $todolist->planning_anp_two = '1';
        $todolist->planning_departure_one = '1';
        $todolist->planning_departure_two = '1'; */

       /* $user->todolist()->save($todolist); */
    }
    /** 
     * Display a listing of the resource. 
     * @return \Illuminate\Http\Response 
     */  
    public function updateTodolist(Request $request)  
    {  
        $validator = Validator::make($request->all(), [
            'property' => 'required',
            'value' => 'required'
            //'is_splash_two' => 'required', 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $todolist = Todolist::whereId($request->input('user_id'))->update([
                $request->input('property') => $request->input('value'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($todolist) {
                return response()->json([
                    'success' => true,
                    'message' => 'Successfully Updated!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Update Fail',
                ], 401);
            }
        }
        
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userTodoList(Request $request) {
        /*
        return response()->json(auth()->user());
        */
        $user = auth()->user();
        $todolist = $user->todolist;
        return response()->json([
            'todolist' => [
                /* 'id' => $todolist->id,
                'userId' => $todolist->user_id, */
                'languageOne' => $todolist->planning_language_one,
                'languageTwo' => $todolist->planning_language_two,
                'languageThree' => $todolist->planning_language_three,
                'documentOne' => $todolist->planning_document_one,
                'documentTwo' => $todolist->planning_document_two,
                'documentThree' => $todolist->planning_document_three,
                'bankOne' => $todolist->planning_bankAccount_one,
                'visaOne' => $todolist->planning_visa_one,
                'visaTwo' => $todolist->planning_visa_two,
                'anpOne' => $todolist->planning_anp_one,
                'anpTwo' => $todolist->planning_anp_two,
                'depOne' => $todolist->planning_departure_one,
                'depTwo' => $todolist->planning_departure_two,
            ]
            ]);
    }
    
    /** 
     * Show the form for creating a new resource. 
     * @return \Illuminate\Http\Response 
         
    */  
    public function create()  
    {  
            
    //  
        
    }  
    /** 
     * Store a newly created resource in storage. 
     * 
     * @param  \Illuminate\Http\Request   $request 
     * @return \Illuminate\Http\Response 
     */  
    public function store(Request $request)  
    {  
            
        // $newTodolist = new Todolist;
        
    }  
    /** 
     * Display the specified resource. 
     * @param  int  $id 
     * @return \Illuminate\Http\Response 
     */  
    public function show($id)  
    {  
    
    //  
    }  
    /** 
     * Show the form for editing the specified resource. 
     * @param  int  $id 
     * @return  \Illuminate\Http\Response 
     */  
    public function edit($id)  
      
    {  
            
    //  
        
    }  
    /** 
     * Update the specified resource in storage. 
     * @param  \Illuminate\Http\Request   $request 
     * @param  int  $id 
     * @return \Illuminate\Http\Response 
     */  
    public function update(Request $request, $id)  
    {  
            
    //  
        
    }  
    /** 
     * Remove the specified resource from storage. 
     * @param  int  $id 
     * @return  \Illuminate\Http\Response 
     */  
    public function destroy($id)  
    {  }
}
