/**
 * Tinypowers plugin for OpenCode.ai
 *
 * Auto-registers the Tinypowers skills directory via config hook.
 */

import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export const TinypowersPlugin = async () => {
  const tinypowersSkillsDir = path.resolve(__dirname, '../../skills');

  return {
    // Inject skills path into live config so OpenCode discovers Tinypowers skills
    // without requiring manual symlinks or config file edits.
    // This works because Config.get() returns a cached singleton — modifications
    // here are visible when skills are lazily discovered later.
    config: async (config) => {
      config.skills = config.skills || {};
      config.skills.paths = config.skills.paths || [];
      if (!config.skills.paths.includes(tinypowersSkillsDir)) {
        config.skills.paths.push(tinypowersSkillsDir);
      }
    },

  };
};
