# Production stage
FROM node:20-slim

WORKDIR /app/backend

# Copy built frontend from frontend-build stage
COPY --from=frontend-build /app/vitereact/dist /app/backend/public
# Copy backend from backend-builder
COPY --from=backend-builder /app/backend ./

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080

# Expose port
EXPOSE 8080

# Start the application
CMD ["node", "server.js"]