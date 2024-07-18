Return-Path: <SRS0=oGkB=OS=gmail.com=malefumakhalanyane@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3781C3DA49
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jul 2024 12:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA859C4AF0A; Thu, 18 Jul 2024 12:48:46 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13B15C116B1
	for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 12:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13B15C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-70b42250526so531895b3a.1
        for <linux-firmware@kernel.org>; Thu, 18 Jul 2024 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721306925; x=1721911725; darn=kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29hom0yIUKXyxGpaBfQEDkClvVe6uzQV9qrVVpyHZAQ=;
        b=PyPE/8kd46V6IUjrVwwPWtyXtrfG/HvgLJwi1SSm4YzOgv58JmUyBKH2AjWfoDGvPS
         kgqNZPxHq9b48LBnSob0p9lUUuiaG4TV1E/Y/ugLJZMBKESnQV9tBQnUKRs/yjJIsZsj
         zngdzo4Xgbj7IMVjWCGL6QQSm3UhzeUx8WWKIwUWCs6M5zDqE8Uw3DXJwMJdjZ0+uucL
         qkFbGgRQHUC6nd/9RHTBUIzIJPyD4PRBLGNhN6c3zylswckuI8ltWDEpw5+3HuZReRLW
         9mQEtypzgNcdbk/TUDjrbsgCNKP2WXC0hVZ4vTsrRaEvuinvdqcMEcpOT878GiU4Ijea
         gZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306925; x=1721911725;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29hom0yIUKXyxGpaBfQEDkClvVe6uzQV9qrVVpyHZAQ=;
        b=MhE6WLh0nMu9m7wqCtQ4b/j/ta+zy8oJkalSQZ2GGtd1sz4q0fq3m7eq6DbSHW/O77
         hjAUzZ+kT07DIb1DBSQDccO86OmyydYDmbYFtVvq3q0xWq6pgSnjLJKyrqkTb8hAolYk
         0F398hCjnlbqeokyk+f7mx1YQRpamRd1VTqf5scIs1sGm5uG+KVWp02Kt9f6tIYfHKEP
         DM3WEsaKiH/vQIID7RGh/HbXPNiqCMnC4+j1Sb6GeZKrvZVLa/KF1FxDEM98m+ignkS+
         WMt1y/qqYNizPlpj2RIFfj2zvu23v+mwjMcoRPpXImdrFqVta4BlJadAGOVO1nU3H21a
         K14g==
X-Gm-Message-State: AOJu0Yx23xSJ+Dk/4cMSKoY6k0SK8tGoxl4v+b53xYsCZFO4pbG2ckT6
	SnQLwQdLuvvBOP0xWXGbwzNjkIwD7qR8F8sYtN/vn0ojBJZb7f1db7HiZK1d
X-Google-Smtp-Source: AGHT+IFllNswr2qGIKrdiyZLB4R1TxE8f3A2fTrk0683ok/CK6wsqh6xAY7Kcb8pYpzXNZpBnmuVZQ==
X-Received: by 2002:a05:6a00:23c1:b0:706:5d85:61a5 with SMTP id d2e1a72fcca58-70ce4f9003amr5763132b3a.8.1721306924947;
        Thu, 18 Jul 2024 05:48:44 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ea794b7sm10015167b3a.0.2024.07.18.05.48.43
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2024 05:48:44 -0700 (PDT)
From: Gina Fogle <malefumakhalanyane@gmail.com>
X-Google-Original-From: Gina Fogle <ginafogle@outlook.com>
Message-ID: <2d8927a108e3eee2b5f9d4183e827f0caa46b5a61539b96ab3a11fa5dca8c340@mx.google.com>
Reply-To: ginafogle@outlook.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Grand Piano 07/18
Date: Thu, 18 Jul 2024 08:48:43 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I'm offering my late husband's Yamaha Piano to any music enthusiast who may appreciate it. If you or someone you know might be interested in receiving this instrument for free, please feel free to reach out to me.

Warm regards,
Gina
