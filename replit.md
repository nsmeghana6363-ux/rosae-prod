# ROSAE Theatre Management System

## Overview

ROSAE is a comprehensive theatre rental business management system built with React (frontend) and Express.js (backend). The system provides booking management, financial tracking, employee management, customer relationship tools, and business analytics. It features a modern dark theme interface optimized for theatre operations management.

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Architecture
- **Framework**: React 18 with TypeScript using Vite as the build tool
- **Styling**: Tailwind CSS with shadcn/ui component library for consistent dark theme design
- **State Management**: TanStack Query for server state management and caching
- **Routing**: Wouter for lightweight client-side routing
- **Authentication**: Session-based authentication with role-based access control (admin/employee)
- **Form Handling**: React Hook Form with Zod validation schemas

### Backend Architecture
- **Runtime**: Node.js with Express.js framework
- **Database**: SQLite with better-sqlite3 driver for local development
- **ORM**: Drizzle ORM for type-safe database operations
- **Session Management**: express-session middleware for authentication state
- **File Structure**: Shared schema definitions between client and server for type consistency

### Data Storage Solutions
- **Primary Database**: SQLite file (`rosae.db`) with comprehensive schema including:
  - Users, bookings, expenses, leave management
  - Customer tickets, reviews, notifications
  - Financial tracking (daily income, ad spend, revenue goals)
  - CRM features (feedbacks, follow-ups, lead info)
- **Schema Management**: Drizzle Kit for migrations and database schema evolution
- **Data Validation**: Zod schemas shared between frontend and backend

### Authentication and Authorization
- **Session-Based Auth**: Uses express-session with cookie storage
- **Role-Based Access**: Admin and employee roles with feature-level permissions
- **Development Mode**: Simplified authentication flow for development environment
- **Security**: Bcrypt for password hashing, JWT tokens for API authentication

### Key Business Features
- **Booking Management**: Theatre booking system with time slots, customer details, payment tracking
- **Financial Management**: Expense tracking, daily income recording, ad spend monitoring
- **Customer Reviews**: Automated review collection system with Google Places integration
- **Employee Management**: Leave applications, user management, activity logging
- **CRM Tools**: Customer feedback collection, follow-up scheduling, lead tracking
- **Analytics Dashboard**: Business insights with charts and KPI tracking

## External Dependencies

### Core Framework Dependencies
- **React Ecosystem**: React 18, React Router (Wouter), React Query (TanStack)
- **UI Components**: Radix UI primitives, Lucide React icons, Tailwind CSS
- **Form Management**: React Hook Form, Hookform Resolvers, Zod validation

### Backend Services
- **Database**: better-sqlite3 for local SQLite operations
- **Authentication**: bcryptjs for password hashing, jsonwebtoken for tokens
- **Email Services**: SendGrid integration for notifications
- **Session Storage**: express-session for authentication state

### Optional Integrations
- **Google Calendar API**: Bi-directional sync for booking management
- **Google Places API**: Review verification and business listing management
- **Webhook Support**: Custom webhook endpoints for external integrations

### Development Tools
- **Build Tools**: Vite for frontend bundling, esbuild for backend compilation
- **Type Safety**: TypeScript throughout, shared schema definitions
- **Code Quality**: ESLint configuration, TypeScript strict mode
- **Testing**: Basic test structure with testing utilities

### Environment Configuration
- **Development**: Hot reload, simplified authentication, local file storage
- **Production**: Optimized builds, secure session configuration, environment-based settings
- **Deployment**: Single SQLite file deployment, static asset serving