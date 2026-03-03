// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#ifndef QDATETIMEPICKER_H
#define QDATETIMEPICKER_H

#include <QQuickItem>
#include <QDateTime>

class QDateTimePicker : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QDateTime selectedDate READ selectedDate WRITE setSelectedDate NOTIFY selectedDateChanged)

public:
    QDateTimePicker(QQuickItem *parent = nullptr);
    QDateTime selectedDate();
    void setSelectedDate(QDateTime);

    Q_INVOKABLE void showDatePicker();

signals:
    void selectedDateChanged();

private:
    QDateTime m_selectedDate;
};

#endif // QDATETIMEPICKER_H
