import { JobConfig, DatasetConfig } from '@/types';

export const defaultDatasetConfig: DatasetConfig = {
  folder_path: '/path/to/images/folder',
  control_path: null,
  mask_path: null,
  mask_min_value: 0.1,
  default_caption: '',
  caption_ext: 'txt',
  caption_dropout_rate: 0.05,
  cache_latents_to_disk: false,
  is_reg: false,
  network_weight: 1,
  resolution: [512],
  controls: [],
  shrink_video_to_frames: true,
  num_frames: 1,
};

export const defaultJobConfig: JobConfig = {
  job: 'extension',
  config: {
    name: '',
    process: [
      {
        type: 'ui_trainer',
        training_folder: 'H:\\AI_WAN_2_1_VACE_VIDEO\AI\\ComfyUI_portable_win_nvidia_python_3_12_10\\ComfyUI\\models\\loras\\WAN_2_1\\custom_trained',
        log_dir: '.\run',
        sqlite_db_path: './aitk_db.db',
        device: 'cuda',
        trigger_word: null,
        performance_log_every: 10,
        network: {
          type: 'lora',
          linear: 32,
          linear_alpha: 32,
          conv: 16,
          conv_alpha: 16,
          lokr_full_rank: true,
          lokr_factor: -1,
          network_kwargs: {
            ignore_if_contains: [],
          },
        },
        save: {
          dtype: 'bf16',
          save_every: 2,
          max_step_saves_to_keep: 1000,
          save_format: 'diffusers',
          push_to_hub: false,
        },
        datasets: [defaultDatasetConfig],
        train: {
          batch_size: 1,
          bypass_guidance_embedding: true,
          steps: 3000,
          gradient_accumulation: 1,
          train_unet: true,
          train_text_encoder: false,
          gradient_checkpointing: true,
          noise_scheduler: 'flowmatch',
          optimizer: 'adamw8bit',
          timestep_type: 'sigmoid',
          content_or_style: 'balanced',
          optimizer_params: {
            weight_decay: 1e-4,
          },
          unload_text_encoder: false,
          lr: 0.0001,
          ema_config: {
            use_ema: false,
            ema_decay: 0.99,
          },
          skip_first_sample: false,
          disable_sampling: false,
          dtype: 'bf16',
          diff_output_preservation: false,
          diff_output_preservation_multiplier: 1.0,
          diff_output_preservation_class: 'person',
        },
        model: {
          name_or_path: 'Wan-AI/Wan2.1-T2V-14B-Diffusers',
          quantize: true,
          quantize_te: true,
          arch: 'wan21:14b',
          low_vram: false,
          model_kwargs: {},
        },
        sample: {
          sampler: 'flowmatch',
          sample_every: 100,
          width: 1024,
          height: 1024,
          samples: [
		    {
              prompt: 'INSERT person in a futuristic cyberpunk city, wearing a hoodie, neon lights',
            },
            {
              prompt: 'A close-up portrait of INSERT person, smiling softly, natural lighting, plain background'
            },
			{
              prompt: 'INSERT person with curly hair, side profile, looking left, cinematic lighting'
            },
          ],
          neg: '',
          seed: 42,
          walk_seed: true,
          guidance_scale: 4,
          sample_steps: 25,
          num_frames: 1,
          fps: 1,
        },
        logging: {
                log_every: 2,
                use_wandb: false,
                verbose: false,
        },
      },
    ],
  },
  meta: {
    name: '[name]',
    version: '1.0',
  },
};

export const migrateJobConfig = (jobConfig: JobConfig): JobConfig => {
  // upgrade prompt strings to samples
  if (
    jobConfig?.config?.process &&
    jobConfig.config.process[0]?.sample &&
    Array.isArray(jobConfig.config.process[0].sample.prompts) &&
    jobConfig.config.process[0].sample.prompts.length > 0
  ) {
    let newSamples = [];
    for (const prompt of jobConfig.config.process[0].sample.prompts) {
      newSamples.push({
        prompt: prompt,
      });
    }
    jobConfig.config.process[0].sample.samples = newSamples;
    delete jobConfig.config.process[0].sample.prompts;
  }
  return jobConfig;
};
