<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Carbon\Carbon;


class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request){
    	$validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if (! $token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->createNewToken($token);
        
        
        /* return response()->json([
            'data' => compact('token')
        ]); */
        
    }

    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|confirmed|min:6',
            'is_splash_two' => 'required|integer|between:0,1',
            'is_splash_three' => 'required|integer|between:0,1',
            'is_splash_four' => 'required|integer|between:0,1',
            'is_splash_five' => 'required|integer|between:0,1',
            'is_splash_six' => 'required|integer|between:0,1',
            'date_start' => 'required|string',
            'date_end' => 'required|string',
        ]); 

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $user = User::create(array_merge(
                    $validator->validated(),
                    ['password' => bcrypt($request->password)]
                ));
    
        //$variableToken = createNewToken(JWTAuth::fromUser($user));
        $token = JWTAuth::fromUser($user);
        return $this->createNewTokenRegis($token, $user);
        //eturn $this->createNewToken($token);
        //createNewToken($token);
        /* return response()->json([
            'message' => 'User successfully registered',
            'user' => $user,
            'data' => compact('token'),
        ], 201); */
    }

    /*
    public function setDateAttribute($value) {
        $this->attributes['date_start'] = Carbon::createFromFormat(config('app.date_format'), $value)->format('Y-m-d');
        $this->attributes['date_end'] = Carbon::createFromFormat(config('app.date_format'), $value)->format('Y-m-d');
    }
    
    public function getDateAttribute($value) {
        return Carbon::parse($value)->format(config('app.date_format'));
    }
    */
    
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateSplashOne (Request $request) {
        $validator = Validator::make($request->all(), [
            'is_splash_one' => 'required',
            //'is_splash_two' => 'required', 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                'is_splash_one' => $request->input('is_splash_one'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateSplashTwo (Request $request) {
        $validator = Validator::make($request->all(), [
            'is_splash_two' => 'required',
            //'is_splash_two' => 'required', 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                'is_splash_two' => $request->input('is_splash_two'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateSplashThree (Request $request) {
        $validator = Validator::make($request->all(), [
            'is_splash_three' => 'required',
            //'is_splash_two' => 'required', 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                'is_splash_three' => $request->input('is_splash_three'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateSplashFour (Request $request) {
        $validator = Validator::make($request->all(), [
            'is_splash_four' => 'required',
            //'is_splash_two' => 'required', 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                'is_splash_four' => $request->input('is_splash_four'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateSplashFive (Request $request) {
        $validator = Validator::make($request->all(), [
            'is_splash_five' => 'required',
            //'is_splash_two' => 'required', 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                'is_splash_five' => $request->input('is_splash_five'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateSplashSix (Request $request) {
        $validator = Validator::make($request->all(), [
            //'is_splash_one' => 'required',
            'is_splash_six' => 'required',
            'date_start' => 'required',
            'date_end' => 'required' 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                //'is_splash_one' => $request->input('is_splash_one'),
                'is_splash_six' => $request->input('is_splash_six'),
                'date_start' => $request->input('date_start'),
                'date_end' => $request->input('date_end'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateDatePrep (Request $request) {
        $validator = Validator::make($request->all(), [
            //'is_splash_one' => 'required',
            'date_start' => 'required',
            'date_end' => 'required' 
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'success' => false,
                'message' => 'Fill in the empty values',
                'data' => $validator->errors()
            ], 401);
        } else {
            $user = User::whereEmail($request->input('email'))->update([
                //'is_splash_one' => $request->input('is_splash_one'),
                'date_start' => $request->input('date_start'),
                'date_end' => $request->input('date_end'),
                //'is_splash_two' => $request->input('is_splash_two'),
            ]);

            if ($user) {
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
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout() {
        auth()->logout();

        return response()->json(['message' => 'User successfully signed out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile(Request $request) {
        /*
        return response()->json(auth()->user());
        */
        $user = $request->user();

        return response()->json([
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'splashTwo' => $user->is_splash_two,
                'splashThree' => $user->is_splash_three,
                'splashFour' => $user->is_splash_four,
                'splashFive' => $user->is_splash_five,
                'splashSix' => $user->is_splash_six,
                'dateStart' => $user->date_start,
                'dateEnd' => $user->date_end,
            ]
            ]);
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 1,
            'user' => auth()->user()
        ]);
    }

    protected function createNewTokenRegis($token, $user){
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 1,
            'user' => $user,
        ], 201);
    }
}