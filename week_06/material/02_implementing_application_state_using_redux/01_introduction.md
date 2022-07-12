
Redux is built up around three main concepts - **store, actions, and reducers**. 

The **store** is a centralized single object with fields for each selection of data. You update the data by dispatching **actions** that says how the data should change. You interpret **actions** and update the data using **reducers**. **Reducers** are functions that apply actions to data and return a new state, instead of mutating the previous state.