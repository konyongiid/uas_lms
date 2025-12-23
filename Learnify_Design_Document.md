# Learnify Design Document

## Design System

### Colors
- **Primary**: #2C7DA0 (Dark blue, used for primary buttons, headings, and key elements)
- **Secondary**: #4DA8DA (Medium blue, used for secondary actions and links)
- **Accent**: #B9E3F2 (Light blue, used for backgrounds and highlights)
- **White**: #FFFFFF (Used for backgrounds and text on colored elements)
- **Light Gray**: #F5F7FA (Used for subtle backgrounds)
- **Dark Gray**: #1F2933 (Used for primary text and strong elements)
- **Medium Gray**: #6B7280 (Used for secondary text and icons)
- **Border Gray**: #E5E7EB (Used for borders and dividers)

### Typography
- **Font Family**: Inter (Sans-serif, modern and readable)
- **Scale**:
  - H1: 32px, Bold, Line height 1.2
  - H2: 24px, Bold, Line height 1.3
  - H3: 20px, Medium, Line height 1.4
  - H4: 18px, Medium, Line height 1.4
  - H5: 16px, Regular, Line height 1.5
  - H6: 14px, Regular, Line height 1.5
  - Body: 16px, Regular, Line height 1.5
  - Small: 14px, Regular, Line height 1.5
  - Button: 16px, Medium, Line height 1.2

### Spacing
- **Base Unit**: 8px (8-point grid system)
- **Standard Spacing Values**: 8px, 16px, 24px, 32px, 48px, 64px
- **Margins/Paddings**: Use multiples of 8px for consistency

### Components

#### Buttons
- **Primary Button**:
  - Height: 48px
  - Background: #2C7DA0
  - Text: #FFFFFF, 16px Medium
  - Border: None
  - Border Radius: 8px
  - Padding: 16px horizontal
  - States: Hover (slight darken), Disabled (opacity 0.5)
- **Secondary Button**:
  - Height: 48px
  - Background: #FFFFFF
  - Text: #2C7DA0, 16px Medium
  - Border: 1px solid #2C7DA0
  - Border Radius: 8px
  - Padding: 16px horizontal
  - States: Hover (bg #F5F7FA), Disabled (opacity 0.5)
- **Text Button**:
  - Height: 48px
  - Background: None
  - Text: #2C7DA0, 16px Medium
  - Border: None
  - Padding: 16px horizontal
  - States: Hover (underline), Disabled (opacity 0.5)

#### Inputs
- **Text Input**:
  - Height: 48px
  - Border: 1px solid #E5E7EB
  - Border Radius: 8px
  - Padding: 16px
  - Text: 16px Regular, #1F2933
  - Placeholder: 16px Regular, #6B7280
  - States:
    - Focus: Border #4DA8DA, subtle shadow
    - Error: Border #FF0000 (red), error text below
    - Disabled: Opacity 0.5
- **Password Input**: Same as text input, with show/hide icon (24px, #6B7280)

#### Icons
- **Size**: 24px
- **Style**: Outline or rounded
- **Color**: #6B7280 (default), #2C7DA0 (active)
- **Usage**: Consistent across app, e.g., eye for password toggle

## Screen Designs

### Splash Screen

#### Textual Description of Layout
- **Background**: Full screen solid color #B9E3F2 (light blue)
- **Content**: Centered horizontally and vertically
  - Logo/Icon: "Learnify" text in Inter Bold, 48px, color #2C7DA0
  - Position: Absolute center of screen
- **Dimensions**: Responsive to screen size, no fixed width/height beyond centering
- **No other elements**: Minimalist design for quick loading

#### Component Structure Breakdown
- Root: Scaffold with full-screen Container
- Child: Center widget containing a Column (though single item, for flexibility)
  - Text widget for logo

#### How the Design System is Applied
- **Colors**: Accent (#B9E3F2) for background, Primary (#2C7DA0) for logo text
- **Typography**: Custom size 48px Bold for logo, using Inter
- **Spacing**: Centered using Flutter's Center widget, no additional spacing needed
- **Components**: No buttons/inputs, just text

#### UX Reasoning for Layout Decisions
- **One Goal per Screen**: The splash screen's sole purpose is to display the brand while the app loads, reinforcing recognition without distraction
- **Hierarchy**: Single centered element creates immediate focus on the brand
- **Minimal Load**: No interactive elements or complex layouts reduce cognitive load and loading time
- **Accessibility**: High contrast between light blue background and dark blue text ensures readability; text size is large for visibility
- **Mobile-First**: Centered layout adapts to various screen sizes without fixed dimensions
- **Professional Academic Style**: Clean, simple design conveys trustworthiness and modernity suitable for university use

### Login Screen

#### Textual Description of Layout
- **Background**: Full screen solid #FFFFFF (white)
- **Top Section** (16px from top):
  - App Name: "Learnify" in Inter Bold, 24px, color #2C7DA0, centered
- **Center Section** (form, 32px below title):
  - Email Input: Full width, placeholder "Email" (Indonesian primary)
  - Spacing: 16px below email
  - Password Input: Full width, placeholder "Kata Sandi", with eye icon for toggle
- **Bottom Section** (32px below form):
  - Login Button: Primary, full width, text "Masuk"
  - Spacing: 16px below button
  - Help Text: "Bantuan" as text button, centered, color #2C7DA0
- **Padding**: 24px horizontal margins for content

#### Component Structure Breakdown
- Root: Scaffold with SafeArea
- Body: Column with mainAxisAlignment: spaceBetween
  - Top: Padding with Text (title)
  - Center: Expanded with Column for form (inputs)
  - Bottom: Column for button and text button

#### How the Design System is Applied
- **Colors**: White background, Primary for title and button, Border Gray for inputs
- **Typography**: H2 for title, Body for inputs, Button for button text
- **Spacing**: 8-point grid (16px, 24px, 32px)
- **Components**: Primary button, text inputs with specified styles, text button

#### UX Reasoning for Layout Decisions
- **One Goal per Screen**: Focused on user authentication with clear email/password entry and login action
- **Hierarchy**: Title at top for brand reinforcement, form in center for primary task, actions at bottom for natural flow
- **Minimal Load**: Only essential fields (email, password) and actions (login, help); no clutter
- **Accessibility**: Large touch targets (48px height), clear labels, high contrast; password toggle aids usability
- **Mobile-First**: Full-width inputs and buttons optimize for thumb navigation; vertical layout suits portrait orientation
- **Professional Style**: Clean spacing and alignment create a trustworthy, academic feel; Indonesian language prioritizes local users

### Help/Support Bottom Sheet

#### Textual Description of Layout
- **Container**: Bottom sheet modal, white background #FFFFFF, rounded top corners (16px radius), max height 70% screen
- **Top Section** (16px padding):
  - Title: "Bantuan" in Inter Medium, 20px, color #1F2933, left-aligned
- **Language Toggle** (16px below title):
  - Label: "Bahasa" (16px, #6B7280), right-aligned switch (ID/EN)
- **Content Sections** (16px below toggle):
  - Section 1: Heading "Pertanyaan Umum" (18px, #1F2933), followed by expandable text list
  - Section 2: Heading "Kontak Kami" (18px, #1F2933), with email/phone icons and text
- **Bottom Section** (16px padding):
  - Contact Button: Secondary, full width, text "Hubungi Dukungan"
- **Scroll**: If content exceeds, scrollable area

#### Component Structure Breakdown
- Root: BottomSheet widget
- Child: Column with SingleChildScrollView
  - Row for title and close icon (optional)
  - Row for language toggle
  - Column for sections (headings and texts)
  - Button at bottom

#### How the Design System is Applied
- **Colors**: White background, Dark Gray for headings, Medium Gray for body, Primary for button
- **Typography**: H3 for title, H4 for section headings, Body for text
- **Spacing**: 16px between sections, 8-point grid
- **Components**: Secondary button, switch for toggle, icons 24px

#### UX Reasoning for Layout Decisions
- **One Goal per Screen**: Provides contextual help without navigating away from login
- **Hierarchy**: Title prominent, toggle for language accessibility, sections organized by topic, action at bottom
- **Minimal Load**: Bottom sheet keeps user in context; expandable sections prevent overload
- **Accessibility**: Language toggle supports bilingual users; clear headings and icons aid navigation; scrollable for long content
- **Mobile-First**: Bottom sheet modal is touch-friendly and space-efficient on mobile
- **Professional Style**: Structured layout with consistent spacing conveys reliability; academic tone in content