<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Validation\Rules\Unique;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\QueueDatas>
 */
class QueueDatasFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'first_name' => fake()->firstName(3),
            'last_name' => fake()->lastName(3),
            'phone' => fake()->phoneNumber(),
            'type' => fake()->name(),
            'queue_status' => fake()->boolean(),
            'queue_number' => fake()->randomNumber(3)
        ];
    }
}
