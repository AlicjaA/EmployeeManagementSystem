﻿using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace BusinessLogic.Interfaces
{

    public interface IRepositoryBase<T> where T : IEntityBase
    {
        T GetById(int id);
        IEnumerable<T> List();
        IEnumerable<T> List(Expression<Func<T, bool>> predicate);
        void Add(T entity);
        void Delete(T entity);
        void Edit(T entity);
    }
}
