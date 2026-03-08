% function u = swing_up_energy_controller(x, params)

    %********************************************** 0.01 ******************************************
    % 
    % --- Controlador de Energia Basado en el Paper IFAC de Mathew, Rao, Sivakumaran ---
    % Referencia: Ecuaciones (11) y (13) del documento. 

    % Extraer estados y parámetros del sistema
    % theta = wrapToPi(x(3)); % Ángulo del péndulo (alpha en el paper)
    % theta_dot = x(4);       % Velocidad angular (alpha_dot en el paper)
    % m = params.mp;
    % L = params.lp;          % El paper usa L como la mitad del largo del péndulo 
    % g = params.g;
    % 
    % % Parámetros de control tomados del paper 
    % k = 1.4;
    % E_0 = -0.1; % Energía deseada (ligeramente por debajo de la energía cero de la pos. vertical)
    % n_sat = 2.6; % Factor de saturación de la aceleración
    % 
    % % Cálculo de la energía normalizada según la Ecuación (11) del paper 
    % J_p = (m * L^2) / 3;    % Inercia del péndulo (asumida como una barra)
    % omega_0 = sqrt(m * g * L / J_p); % Frecuencia de oscilación 
    % 
    % % Definición de energía que es CERO en la posición vertical
    % E = 0.5 * (theta_dot / omega_0)^2 + cos(theta) - 1;
    % 
    % % Ley de control según la Ecuación (13) del paper 
    % % El término sign(theta_dot * cos(theta)) asegura que la energía se inyecte correctamente.
    % u = k * (E - E_0) * sign(theta_dot * cos(theta));
    % 
    % % Saturación de la señal de control, como se indica en la Ecuación (13) 
    % % La variable 'u' aquí es la aceleración del pivote, no el torque.
    % % Se omite la conversión directa y se aplica un límite de torque razonable.
    % u_max = 0.5; % Límite de torque práctico
    % u = max(min(u, u_max), -u_max);




    %********************************************** 0.1 ******************************************
    % 
    % 
    %     % --- Controlador de Energia Basado en el Paper IFAC de Mathew, Rao, Sivakumaran ---
    % % Referencia: Ecuaciones (11) y (13) del documento. 
    % 
    % % Extraer estados y parámetros del sistema
    % theta = wrapToPi(x(3)); % Ángulo del péndulo (alpha en el paper)
    % theta_dot = x(4);       % Velocidad angular (alpha_dot en el paper)
    % m = params.mp;
    % L = params.lp;          % El paper usa L como la mitad del largo del péndulo 
    % g = params.g;
    % 
    % % Parámetros de control tomados del paper 
    % k = 0.8;
    % E_0 = -0.1; % Energía deseada (ligeramente por debajo de la energía cero de la pos. vertical)
    % n_sat = 2.6; % Factor de saturación de la aceleración
    % 
    % % Cálculo de la energía normalizada según la Ecuación (11) del paper 
    % J_p = (m * L^2) / 3;    % Inercia del péndulo (asumida como una barra)
    % omega_0 = sqrt(m * g * L / J_p); % Frecuencia de oscilación 
    % 
    % % Definición de energía que es CERO en la posición vertical
    % E = 0.5 * (theta_dot / omega_0)^2 + cos(theta) - 1;
    % 
    % % Ley de control según la Ecuación (13) del paper 
    % % El término sign(theta_dot * cos(theta)) asegura que la energía se inyecte correctamente.
    % u = k * (E - E_0) * sign(theta_dot * cos(theta));
    % 
    % % Saturación de la señal de control, como se indica en la Ecuación (13) 
    % % La variable 'u' aquí es la aceleración del pivote, no el torque.
    % % Se omite la conversión directa y se aplica un límite de torque razonable.
    % u_max = 0.1; % Límite de torque práctico
    % u = max(min(u, u_max), -u_max);

        %********************************************** Copelia ******************************************
    % 

            % --- Controlador de Energia Basado en el Paper IFAC de Mathew, Rao, Sivakumaran ---
    % Referencia: Ecuaciones (11) y (13) del documento. 

    % % Extraer estados y parámetros del sistema
    % theta = wrapToPi(x(3)); % Ángulo del péndulo (alpha en el paper)
    % theta_dot = x(4);       % Velocidad angular (alpha_dot en el paper)
    % m = params.mp;
    % L = params.lp;          % El paper usa L como la mitad del largo del péndulo 
    % g = params.g;
    % 
    % % Parámetros de control tomados del paper 
    % k = 0.45;
    % E_0 = -0.1; % Energía deseada (ligeramente por debajo de la energía cero de la pos. vertical)
    % n_sat = 2.6; % Factor de saturación de la aceleración
    % 
    % % Cálculo de la energía normalizada según la Ecuación (11) del paper 
    % J_p = (m * L^2) / 3;    % Inercia del péndulo (asumida como una barra)
    % omega_0 = sqrt(m * g * L / J_p); % Frecuencia de oscilación 
    % 
    % % Definición de energía que es CERO en la posición vertical
    % E = 0.5 * (theta_dot / omega_0)^2 + cos(theta) - 1;
    % 
    % % Ley de control según la Ecuación (13) del paper 
    % % El término sign(theta_dot * cos(theta)) asegura que la energía se inyecte correctamente.
    % u = k * (E - E_0) * sign(theta_dot * cos(theta));
    % 
    % % Saturación de la señal de control, como se indica en la Ecuación (13) 
    % % La variable 'u' aquí es la aceleración del pivote, no el torque.
    % % Se omite la conversión directa y se aplica un límite de torque razonable.
    % u_max = 0.4; % Límite de torque práctico
    % u = max(min(u, u_max), -u_max);
% end
function u = swing_up_energy_controller(x, params)
    % Controlador de Swing-up mejorado para CoppeliaSim
    % Reduce oscilaciones indeseadas y mejora el comportamiento

    % Extraer estados
    phi = x(1);        % Ángulo del brazo
    phi_dot = x(2);    % Velocidad del brazo
    theta = x(3);      % Ángulo del péndulo
    theta_dot = x(4);  % Velocidad del péndulo

    % Normalizar ángulo del péndulo a [-pi, pi]
    theta = wrapToPi(theta);

    % Parámetros del sistema
    m = params.mp;     % Masa del péndulo
    L = params.lp;     % Longitud del péndulo
    g = params.g;      % Gravedad

    % Parámetros del controlador (ajustados para CoppeliaSim)
    k_energy = 1.7;   % Ganancia principal (reducida para suavizar)
    E_target = -0.05;  % Energía objetivo (más conservadora)
    k_damping = 0.05;  % Término de amortiguamiento

    % Cálculo de la energía normalizada del péndulo
    J_p = (m * L^2) / 3;                    % Inercia del péndulo
    omega_0 = sqrt(m * g * L / J_p);        % Frecuencia natural

    % Energía normalizada (cero en posición vertical superior)
    E_normalized = 0.5 * (theta_dot / omega_0)^2 + cos(theta) - 1;

    % Error de energía
    E_error = E_normalized - E_target;

    % Función de switching suavizada (evita discontinuidades bruscas)
    switching_function = tanh(5 * theta_dot * cos(theta));

    % Control principal basado en energía
    u_energy = k_energy * E_error * switching_function;

    % Término de amortiguamiento para reducir oscilaciones del brazo
    u_damping = -k_damping * phi_dot;

    % Modificación basada en la proximidad a la vertical
    % Reduce la ganancia cuando el péndulo está cerca de la vertical
    proximity_factor = abs(cos(theta));  % 1 cuando horizontal, 0 cuando vertical
    u_energy = u_energy * (0.3 + 0.7 * proximity_factor);

    % Control total
    u = u_energy + u_damping;

    % Saturación suave para evitar cambios bruscos
    u_max = 0.5;  % Límite más conservador
    u = u_max * tanh(u / u_max);

    % Filtro adicional para suavizar la señal
    % (Solo funciona si mantienes una variable persistente)
    persistent u_prev;
    if isempty(u_prev)
        u_prev = 0;
    end

    % Filtro pasa-bajos de primer orden
    alpha_filter = 0.8;  % Factor de filtrado (0-1, más bajo = más filtrado)
    u = alpha_filter * u + (1 - alpha_filter) * u_prev;
    u_prev = u;

    % Zona muerta para evitar movimientos innecesarios cuando está cerca
    if abs(theta) < deg2rad(10) && abs(theta_dot) < 0.5
        u = u * 0.1;  % Reducir drásticamente el control
    end

end