import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'frontend';
  constructor(private http: HttpClient) {}
  helloFromBack = '';
  messageFromBack = '';

  ngOnInit() { 
    this.http.get('http://localhost:8080/get', { responseType: 'text' })
      .subscribe({
        next: (data: string) => {
          this.helloFromBack = data;
        },
        error: (error) => console.error('Error fetching data:', error)
      });
  }
  getRandom(){
    this.http.get<any>('http://localhost:8080/getRandom').subscribe({
    next: (data) => {
      this.messageFromBack = data.message;
    },
    error: (error) => {
      console.error('Error fetching random data:', error);
      this.messageFromBack = 'Failed to fetch data';
    }
  });
  }
}
