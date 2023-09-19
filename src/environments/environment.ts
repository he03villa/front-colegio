export const environment = {
    production: false,
    ApiURL: 'http://localhost:5204/api/',
    api: {
        asignacion: {
            name: "asignacion",
            services: {
                asignarProfesor: '/asignar_profesor',
                asignarEstudiante: '/asignar_estudiante'
            }
        },
        estudiante: {
            name: "estudiante"
        },
        profesor: {
            name: "profesor"
        }
    }
};
