import { render } from 'react-dom';
import App from './App';

test('renders learn react link', () => {
    const div = document.createElement('div');
    render(<App />, div);
    const linkElement = div.querySelector('.App-link');
    expect(linkElement?.textContent).toBe('Learn React');
});
