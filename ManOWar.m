function ManOWar ()
    global tank1_bullet1_figure; global tank1_bullet1_exist;
    global tank1_bullet2_figure; global tank1_bullet2_exist;
    global tank1_bullet3_figure; global tank1_bullet3_exist;
    global tank1_boom1_figure; global tank1_boom1_exist;
    global tank1_boom2_figure; global tank1_boom2_exist;
    global tank1_boom3_figure; global tank1_boom3_exist;
    tank1_bullet1_exist = 0;
    tank1_bullet2_exist = 0;
    tank1_bullet3_exist = 0;
    tank1_boom1_exist = 0;
    tank1_boom2_exist = 0;
    tank1_boom3_exist = 0;
    tank1_bullet1_direction = 1;
    tank1_bullet2_direction = 1;
    tank1_bullet3_direction = 1;

    
    global tank2_bullet1_figure; global tank2_bullet1_exist;
    global tank2_bullet2_figure; global tank2_bullet2_exist;
    global tank2_bullet3_figure; global tank2_bullet3_exist;
    global tank2_boom1_figure; global tank2_boom1_exist;
    global tank2_boom2_figure; global tank2_boom2_exist;
    global tank2_boom3_figure; global tank2_boom3_exist;
    tank2_bullet1_exist = 0;
    tank2_bullet2_exist = 0;
    tank2_bullet3_exist = 0;
    tank2_boom1_exist = 0;
    tank2_boom2_exist = 0;
    tank2_boom3_exist = 0;
    tank2_bullet1_direction = 1;
    tank2_bullet2_direction = 1;
    tank2_bullet3_direction = 1;
    
    tank1_is_dead = false;
    tank2_is_dead = false;
    
    bullet_edge_color = '#3232CD';
    bullet_face_color = '#007FFF';
    bullet_line_width = 1.5;
    
    bullet2_edge_color = '#BC1717';
    bullet2_face_color = '#CC3299';
    bullet2_line_width = 1.5;
    
    boom1_edge_color = '#3232CD';
    boom1_face_color = '#007FFF';
    boom1_line_width = 1.5;
    
    boom2_edge_color = '#BC1717';
    boom2_face_color = '#CC3299';
    boom2_line_width = 1.5;
    
    bullet_speed = 0.02;
    
    fig = figure('KeyPressFcn', @kp, 'KeyReleaseFcn',@kr);
    b = axes;
    b.Color = '#EBC79E'; %場內顏色
    set(fig, 'color', '#6B8E23') %場外顏色
    hold on
    
    tank_player1_is_press = struct('up', false,'down', false,'right', false,'left',false);
    tank_player2_is_press = struct('up', false,'down', false,'right', false,'left',false);
    size_of_tank = 200;
    tank_player1_figure = scatter(1, 1, size_of_tank,...
                'd',...
                'MarkerEdgeColor', '#3232CD',...
                'MarkerFaceColor', '#007FFF',...
                'LineWidth',2.5);
    hold on
    tank_player2_figure = scatter(3, 3, size_of_tank,...
                'd',... 
                'MarkerEdgeColor', '#BC1717',...
                'MarkerFaceColor', '#CC3299',...
                'LineWidth',2.5);
    hold on
    axis([0 5 0 5]);
    game = timer('ExecutionMode','FixedRate','Period',0.01,'TimerFcn',@GameStart);
    start(game)
    
    function GameStart(~, ~)
        %Tank 1 Movement  -------------------------------------------------
        if tank_player1_is_press.up%Tank 1 Movement
            tank_player1_figure.YData = tank_player1_figure.YData + 0.01;
        end
        if tank_player1_is_press.down
            tank_player1_figure.YData = tank_player1_figure.YData - 0.01;
        end
        if tank_player1_is_press.right
            tank_player1_figure.XData = tank_player1_figure.XData + 0.01;
        end
        if tank_player1_is_press.left
            tank_player1_figure.XData = tank_player1_figure.XData - 0.01;
        end
        
        %Tank 2 Movement  -------------------------------------------------
        if tank_player2_is_press.up
            tank_player2_figure.YData = tank_player2_figure.YData + 0.01;
        end
        if tank_player2_is_press.down
            tank_player2_figure.YData = tank_player2_figure.YData - 0.01;
        end
        if tank_player2_is_press.right
            tank_player2_figure.XData = tank_player2_figure.XData + 0.01;
        end
        if tank_player2_is_press.left
            tank_player2_figure.XData = tank_player2_figure.XData - 0.01;
        end  
        
        %Tank 1 Bullet Up -------------------------------------------------
        if tank1_bullet1_exist == 1 && tank1_bullet1_direction == 1
            tank1_bullet1_figure.YData = tank1_bullet1_figure.YData + bullet_speed;
            if tank1_bullet1_figure.YData > 5
                tank1_bullet1_exist = 0;
            end
        end
        if tank1_bullet2_exist == 1 && tank1_bullet2_direction == 1
            tank1_bullet2_figure.YData = tank1_bullet2_figure.YData + bullet_speed;
            if tank1_bullet2_figure.YData > 5
                tank1_bullet2_exist = 0;
            end
        end
        if tank1_bullet3_exist == 1 && tank1_bullet3_direction == 1
            tank1_bullet3_figure.YData = tank1_bullet3_figure.YData + bullet_speed;
            if tank1_bullet3_figure.YData > 5
                tank1_bullet3_exist = 0;
            end
        end
        
        %Tank 1 Bullet Down -------------------------------------------------
        if tank1_bullet1_exist == 1 && tank1_bullet1_direction == 2
            tank1_bullet1_figure.YData = tank1_bullet1_figure.YData - bullet_speed;
            if tank1_bullet1_figure.YData < -1
                tank1_bullet1_exist = 0;
            end
        end
        if tank1_bullet2_exist == 1 && tank1_bullet2_direction == 2
            tank1_bullet2_figure.YData = tank1_bullet2_figure.YData - bullet_speed;
            if tank1_bullet2_figure.YData < -1
                tank1_bullet2_exist = 0;
            end
        end
        if tank1_bullet3_exist == 1 && tank1_bullet3_direction == 2
            tank1_bullet3_figure.YData = tank1_bullet3_figure.YData - bullet_speed;
            if tank1_bullet3_figure.YData < -1
                tank1_bullet3_exist = 0;
            end
        end
        
        %Tank 1 Bullet Right -------------------------------------------------
        if tank1_bullet1_exist == 1 && tank1_bullet1_direction == 3
            tank1_bullet1_figure.XData = tank1_bullet1_figure.XData + bullet_speed;
            if tank1_bullet1_figure.XData > 5
                tank1_bullet1_exist = 0;
            end
        end
        if tank1_bullet2_exist == 1 && tank1_bullet2_direction == 3
            tank1_bullet2_figure.XData = tank1_bullet2_figure.XData + bullet_speed;
            if tank1_bullet2_figure.XData > 5
                tank1_bullet2_exist = 0;
            end
        end
        if tank1_bullet3_exist == 1 && tank1_bullet3_direction == 3
            tank1_bullet3_figure.XData = tank1_bullet3_figure.XData + bullet_speed;
            if tank1_bullet3_figure.XData > 5
                tank1_bullet3_exist = 0;
            end
        end
        
        %Tank 1 Bullet Left -------------------------------------------------
        if tank1_bullet1_exist == 1 && tank1_bullet1_direction == 4
            tank1_bullet1_figure.XData = tank1_bullet1_figure.XData - bullet_speed;
            if tank1_bullet1_figure.XData < -1
                tank1_bullet1_exist = 0;
            end
        end
        if tank1_bullet2_exist == 1 && tank1_bullet2_direction == 4
            tank1_bullet2_figure.XData = tank1_bullet2_figure.XData - bullet_speed;
            if tank1_bullet2_figure.XData < -1
                tank1_bullet2_exist = 0;
            end
        end
        if tank1_bullet3_exist == 1 && tank1_bullet3_direction == 4
            tank1_bullet3_figure.XData = tank1_bullet3_figure.XData - bullet_speed;
            if tank1_bullet3_figure.XData < -1
                tank1_bullet3_exist = 0;
            end
        end
        
        %Tank 2 Bullet Up  -------------------------------------------------
        if tank2_bullet1_exist == 1 && tank2_bullet1_direction == 1
            tank2_bullet1_figure.YData = tank2_bullet1_figure.YData + bullet_speed;
            if tank2_bullet1_figure.YData > 5
                tank2_bullet1_exist = 0;
            end
        end
        if tank2_bullet2_exist == 1 && tank2_bullet2_direction == 1
            tank2_bullet2_figure.YData = tank2_bullet2_figure.YData + bullet_speed;
            if tank2_bullet2_figure.YData > 5
                tank2_bullet2_exist = 0;
            end
        end
        if tank2_bullet3_exist == 1 && tank2_bullet3_direction == 1
            tank2_bullet3_figure.YData = tank2_bullet3_figure.YData + bullet_speed;
            if tank2_bullet3_figure.YData > 5
                tank2_bullet3_exist = 0;
            end
        end
        
        %Tank 2 Bullet Down  -------------------------------------------------
        if tank2_bullet1_exist == 1 && tank2_bullet1_direction == 2
            tank2_bullet1_figure.YData = tank2_bullet1_figure.YData - bullet_speed;
            if tank2_bullet1_figure.YData < -1
                tank2_bullet1_exist = 0;
            end
        end
        if tank2_bullet2_exist == 1 && tank2_bullet2_direction == 2
            tank2_bullet2_figure.YData = tank2_bullet2_figure.YData - bullet_speed;
            if tank2_bullet2_figure.YData < -1
                tank2_bullet2_exist = 0;
            end
        end
        if tank2_bullet3_exist == 1 && tank2_bullet3_direction == 2
            tank2_bullet3_figure.YData = tank2_bullet3_figure.YData - bullet_speed;
            if tank2_bullet3_figure.YData < -1
                tank2_bullet3_exist = 0;
            end
        end
        
        %Tank 2 Bullet Right  -------------------------------------------------
        if tank2_bullet1_exist == 1 && tank2_bullet1_direction == 3
            tank2_bullet1_figure.XData = tank2_bullet1_figure.XData + bullet_speed;
            if tank2_bullet1_figure.XData > 5
                tank2_bullet1_exist = 0;
            end
        end
        if tank2_bullet2_exist == 1 && tank2_bullet2_direction == 3
            tank2_bullet2_figure.XData = tank2_bullet2_figure.XData + bullet_speed;
            if tank2_bullet2_figure.XData > 5
                tank2_bullet2_exist = 0;
            end
        end
        if tank2_bullet3_exist == 1 && tank2_bullet3_direction == 3
            tank2_bullet3_figure.XData = tank2_bullet3_figure.XData + bullet_speed;
            if tank2_bullet3_figure.XData > 5
                tank2_bullet3_exist = 0;
            end
        end
        
        %Tank 2 Bullet Left  -------------------------------------------------
        if tank2_bullet1_exist == 1 && tank2_bullet1_direction == 4
            tank2_bullet1_figure.XData = tank2_bullet1_figure.XData - bullet_speed;
            if tank2_bullet1_figure.XData < -1
                tank2_bullet1_exist = 0;
            end
        end
        if tank2_bullet2_exist == 1 && tank2_bullet2_direction == 4
            tank2_bullet2_figure.XData = tank2_bullet2_figure.XData - bullet_speed;
            if tank2_bullet2_figure.XData < -1
                tank2_bullet2_exist = 0;
            end
        end
        if tank2_bullet3_exist == 1 && tank2_bullet3_direction == 4
            tank2_bullet3_figure.XData = tank2_bullet3_figure.XData - bullet_speedasd;
            if tank2_bullet3_figure.XData < -1
                tank2_bullet3_exist = 0;
            end
        end
        
        CheckDead()
        if tank1_is_dead || tank2_is_dead
            GameOver()
        end
    end
    
    function kp(~, event)
        switch event.Character
            case 119
                tank_player1_is_press.up = true;
            case 97
                tank_player1_is_press.left = true;
            case 115
                tank_player1_is_press.down = true;
            case 100
                tank_player1_is_press.right = true;
            case 30
                tank_player2_is_press.up = true;
            case 31
                tank_player2_is_press.down = true;
            case 29
                tank_player2_is_press.right = true;
            case 28
                tank_player2_is_press.left = true;
            case 103
                Tank1StraightFire();
            case 98
                Tank1DownFire();
            case 110
                Tank1RightFire()
            case 118
                Tank1LeftFire()
            case 53
                Tank2StraightFire();
            case 50
                Tank2DownFire()
            case 51
                Tank2RightFire();
            case 49
                Tank2LeftFire();
            case 32
                Tank1SetBoom();
            case 43
                Tank2SetBoom();
        end
    end

    function kr(~, event)
        switch event.Character
            case 119
                tank_player1_is_press.up = false;
            case 97
                tank_player1_is_press.left = false;
            case 115
                tank_player1_is_press.down = false;
            case 100
                tank_player1_is_press.right = false;
            case 30
                tank_player2_is_press.up = false;
            case 31
                tank_player2_is_press.down = false;
            case 29
                tank_player2_is_press.right = false;
            case 28
                tank_player2_is_press.left = false;
        end
    end
    
    function Tank1StraightFire()
        if tank1_bullet1_exist == 0
            tank1_bullet1_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet1_exist = 1;
            tank1_bullet1_direction = 1;
        elseif tank1_bullet2_exist == 0
            tank1_bullet2_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet2_exist = 1;
            tank1_bullet2_direction = 1;
        elseif tank1_bullet3_exist == 0
            tank1_bullet3_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet3_exist = 1;
            tank1_bullet3_direction = 1;
        else
            disp("out of charge! ")
        end
    end

    function Tank1DownFire()
        if tank1_bullet1_exist == 0
            tank1_bullet1_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet1_exist = 1;
            tank1_bullet1_direction = 2;
        elseif tank1_bullet2_exist == 0
            tank1_bullet2_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet2_exist = 1;
            tank1_bullet2_direction = 2;
        elseif tank1_bullet3_exist == 0
            tank1_bullet3_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet3_exist = 1;
            tank1_bullet3_direction = 2;
        else
            disp("out of charge! ")
        end
    end

    function Tank1RightFire()
        if tank1_bullet1_exist == 0
            tank1_bullet1_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet1_exist = 1;
            tank1_bullet1_direction = 3;
        elseif tank1_bullet2_exist == 0
            tank1_bullet2_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet2_exist = 1;
            tank1_bullet2_direction = 3;
        elseif tank1_bullet3_exist == 0
            tank1_bullet3_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet3_exist = 1;
            tank1_bullet3_direction = 3;
        else
            disp("out of charge! ")
        end
    end

    function Tank1LeftFire()
        if tank1_bullet1_exist == 0
            tank1_bullet1_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet1_exist = 1;
            tank1_bullet1_direction = 4;
        elseif tank1_bullet2_exist == 0
            tank1_bullet2_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet2_exist = 1;
            tank1_bullet2_direction = 4;
        elseif tank1_bullet3_exist == 0
            tank1_bullet3_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData,...
              'MarkerEdgeColor',bullet_edge_color,...
              'MarkerFaceColor',bullet_face_color,...
              'LineWidth',bullet_line_width);
            tank1_bullet3_exist = 1;
            tank1_bullet3_direction = 4;
        else
            disp("out of charge! ")
        end
    end

    function Tank2StraightFire()
        if tank2_bullet1_exist == 0
            tank2_bullet1_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet1_exist = 1;
            tank2_bullet1_direction = 1;
        elseif tank2_bullet2_exist == 0
            tank2_bullet2_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet2_exist = 1;
            tank2_bullet2_direction = 1;
        elseif tank2_bullet3_exist == 0
            tank2_bullet3_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet3_exist = 1;
            tank2_bullet3_direction = 1;
        else
            disp("out of charge! ")
        end
    end

    function Tank2DownFire()
        if tank2_bullet1_exist == 0
            tank2_bullet1_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet1_exist = 1;
            tank2_bullet1_direction = 2;
        elseif tank2_bullet2_exist == 0
            tank2_bullet2_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet2_exist = 1;
            tank2_bullet2_direction = 2;
        elseif tank2_bullet3_exist == 0
            tank2_bullet3_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet3_exist = 1;
            tank2_bullet3_direction = 2;
        else
            disp("out of charge! ")
        end
    end

    function Tank2RightFire()
        if tank2_bullet1_exist == 0
            tank2_bullet1_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet1_exist = 1;
            tank2_bullet1_direction = 3;
        elseif tank2_bullet2_exist == 0
            tank2_bullet2_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet2_exist = 1;
            tank2_bullet2_direction = 3;
        elseif tank2_bullet3_exist == 0
            tank2_bullet3_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet3_exist = 1;
            tank2_bullet3_direction = 3;
        else
            disp("out of charge! ")
        end
    end

    function Tank2LeftFire()
        if tank2_bullet1_exist == 0
            tank2_bullet1_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet1_exist = 1;
            tank2_bullet1_direction = 4;
        elseif tank2_bullet2_exist == 0
            tank2_bullet2_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet2_exist = 1;
            tank2_bullet2_direction = 4;
        elseif tank2_bullet3_exist == 0
            tank2_bullet3_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData,...
              'MarkerEdgeColor',bullet2_edge_color,...
              'MarkerFaceColor',bullet2_face_color,...
              'LineWidth',bullet2_line_width);
            tank2_bullet3_exist = 1;
            tank2_bullet3_direction = 4;
        else
            disp("out of charge! ")
        end
    end
    
    function Tank1SetBoom()
        if tank1_boom1_exist == 0
            tank1_boom1_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData, 1000,...
              'MarkerEdgeColor',boom1_edge_color,...
              'MarkerFaceColor',boom1_face_color,...
              'LineWidth',boom1_line_width);
            tank1_boom1_exist = 1;
        elseif tank1_boom2_exist == 0
            tank1_boom2_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData, 1000,...
              'MarkerEdgeColor',boom1_edge_color,...
              'MarkerFaceColor',boom1_face_color,...
              'LineWidth',boom1_line_width);
            tank1_boom2_exist = 1;
        elseif tank1_boom3_exist == 0
            tank1_boom3_figure = scatter(tank_player1_figure.XData, tank_player1_figure.YData, 1000,...
              'MarkerEdgeColor',boom1_edge_color,...
              'MarkerFaceColor',boom1_face_color,...
              'LineWidth',boom1_line_width);
            tank1_boom3_exist = 1;
        else
            disp("out of boom.")
        end
    end

    function Tank2SetBoom()
        if tank2_boom1_exist == 0
            tank2_boom1_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData, 1000,...
              'MarkerEdgeColor',boom2_edge_color,...
              'MarkerFaceColor',boom2_face_color,...
              'LineWidth',boom2_line_width);
            tank2_boom1_exist = 1;
        elseif tank2_boom2_exist == 0
            tank2_boom2_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData, 1000,...
              'MarkerEdgeColor',boom2_edge_color,...
              'MarkerFaceColor',boom2_face_color,...
              'LineWidth',boom2_line_width);
            tank2_boom2_exist = 1;
        elseif tank2_boom3_exist == 0
            tank2_boom3_figure = scatter(tank_player2_figure.XData, tank_player2_figure.YData, 1000,...
              'MarkerEdgeColor',boom2_edge_color,...
              'MarkerFaceColor',boom2_face_color,...
              'LineWidth',boom2_line_width);
            tank2_boom3_exist = 1;
        else
            disp("out of boom.")
        end
    end

    function CheckDead()
        if tank1_bullet1_exist == 1
            if tank1_bullet1_figure.XData <= tank_player2_figure.XData + 0.1 && tank1_bullet1_figure.XData >= tank_player2_figure.XData - 0.1 &&...
                tank1_bullet1_figure.YData <= tank_player2_figure.YData + 0.1 && tank1_bullet1_figure.YData >= tank_player2_figure.YData - 0.1
                tank2_is_dead = true;
            end
        end
        if tank1_bullet2_exist == 1
            if tank1_bullet2_figure.XData <= tank_player2_figure.XData + 0.1 && tank1_bullet2_figure.XData >= tank_player2_figure.XData - 0.1 &&...
                tank1_bullet2_figure.YData <= tank_player2_figure.YData + 0.1 && tank1_bullet2_figure.YData >= tank_player2_figure.YData - 0.1
                tank2_is_dead = true;
            end
        end
        if tank1_bullet3_exist == 1
            if tank1_bullet3_figure.XData <= tank_player2_figure.XData + 0.1 && tank1_bullet3_figure.XData >= tank_player2_figure.XData - 0.1 &&...
                tank1_bullet3_figure.YData <= tank_player2_figure.YData + 0.1 && tank1_bullet3_figure.YData >= tank_player2_figure.YData - 0.1
                tank2_is_dead = true;
            end
        end
        
        if tank2_bullet1_exist == 1
            if tank2_bullet1_figure.XData <= tank_player1_figure.XData + 0.1 && tank2_bullet1_figure.XData >= tank_player1_figure.XData - 0.1 &&...
                tank2_bullet1_figure.YData <= tank_player1_figure.YData + 0.1 && tank2_bullet1_figure.YData >= tank_player1_figure.YData - 0.1
                tank1_is_dead = true;
            end
        end
        if tank2_bullet2_exist == 1
            if tank2_bullet2_figure.XData <= tank_player1_figure.XData + 0.1 && tank2_bullet2_figure.XData >= tank_player1_figure.XData - 0.1 &&...
                tank2_bullet2_figure.YData <= tank_player1_figure.YData + 0.1 && tank2_bullet2_figure.YData >= tank_player1_figure.YData - 0.1
                tank1_is_dead = true;
            end
        end
        if tank2_bullet3_exist == 1
            if tank2_bullet3_figure.XData <= tank_player1_figure.XData + 0.1 && tank2_bullet3_figure.XData >= tank_player1_figure.XData - 0.1 &&...
                tank2_bullet3_figure.YData <= tank_player1_figure.YData + 0.1 && tank2_bullet3_figure.YData >= tank_player1_figure.YData - 0.1
                tank1_is_dead = true;
            end
        end
        if tank1_boom1_exist == 1
            if InCircle(tank_player2_figure.XData, tank_player2_figure.YData, tank1_boom1_figure.XData, tank1_boom1_figure.YData) == 1
                 tank2_is_dead = true;
            end
        end
        if tank1_boom2_exist == 1
            if InCircle(tank_player2_figure.XData, tank_player2_figure.YData, tank1_boom2_figure.XData, tank1_boom2_figure.YData) == 1
                 tank2_is_dead = true;
            end
        end
        if tank1_boom3_exist == 1
            if InCircle(tank_player2_figure.XData, tank_player2_figure.YData, tank1_boom3_figure.XData, tank1_boom3_figure.YData) == 1
                 tank2_is_dead = true;
            end
        end
        
        if tank2_boom1_exist == 1
            if InCircle(tank_player1_figure.XData, tank_player1_figure.YData, tank2_boom1_figure.XData, tank2_boom1_figure.YData) == 1
                 tank1_is_dead = true;
            end
        end
        if tank2_boom2_exist == 1
            if InCircle(tank_player1_figure.XData, tank_player1_figure.YData, tank2_boom2_figure.XData, tank2_boom2_figure.YData) == 1
                 tank1_is_dead = true;
            end
        end
        if tank2_boom3_exist == 1
            if InCircle(tank_player1_figure.XData, tank_player1_figure.YData, tank2_boom3_figure.XData, tank2_boom3_figure.YData) == 1
                 tank1_is_dead = true;
            end
        end
    end
    
    function GameOver()
        stop(game)
        delete(game)
        
        if tank1_is_dead
            msgbox("Player 2 win!")
        end
        if tank2_is_dead
            msgbox("Player 1 win!")
        end
    end

    function out = InCircle(x, y, center_x, center_y)
        dis = (x-center_x)*(x-center_x) + (y-center_y)*(y-center_y);
        if dis <= 0.38*0.38
            out = 1;
        else
            out = 0;
        end
        
    end
end
