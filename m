Return-Path: <SRS0=bInt=RV=gmail.com=naghamtony726256@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325C7D149CD
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Oct 2024 18:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E650C4CEE3; Fri, 25 Oct 2024 18:12:04 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AB9EC4CEE4
	for <linux-firmware@kernel.org>; Fri, 25 Oct 2024 18:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AB9EC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20cdb889222so21668225ad.3
        for <linux-firmware@kernel.org>; Fri, 25 Oct 2024 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729879922; x=1730484722; darn=kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdDXVlVSuD7bbtK+/LaCQ8JSlo0lFo/SuY3hXdbU+s0=;
        b=kiii8EKd1GwnpXQ1XE2/Su0SCfcj817/sy7lVyB7USSxPbSs1/7VW2g0u2URuCStgi
         KyrsTij5mVGMjwcvKqnmqg1hS5b9n1drhpy41gU9hOBPl9Roa8e0jfpROUd9lzFAmqGz
         lNcxW2V33lCW3BdUWiwftNuF/M8miLRiYIaKHfsSA4hZCoWQk2hLmqjjzcpcnXuaDRzV
         DHXIVlaAExK0l2C/WnZtSio7JUhZmISFVJSkLDd1ElzV3fCpGneNTq5EAsFSplIyJ/Cy
         gKsu70DI/xSCvLkrrG9Wznf77Ob/0CPivaxH+VrBsSWGa3v7UHos1EtcCO2MmFjD3Jn8
         HAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879922; x=1730484722;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdDXVlVSuD7bbtK+/LaCQ8JSlo0lFo/SuY3hXdbU+s0=;
        b=fjcNYZUYQvB9LZcLWv3+nThTyoYlUFipkI46lX1FKb0u55NRcVhhL9cfI8WTLo3IpM
         D6EVHbmDDI2PU3XYNp68y7jkEjdfckUjL9AVJB0wa/vP0kL2oiqfec+QZYdim5Gnlk1p
         b/ZTPr3mZW9NR5oFrT+ywYStkRdtGWdC9Dp4toYQZaOGnl0Hd9xt22hFfyHWQg7Fx9Kk
         hIFdaHKDHPo/Nhwoe5+xi3jsKLVFaYAq6MHO4oZd03F9/OJKH3nfPvc0H3a79kv4+nI3
         jVBfSJt7VLWLikHL1cxYS0DDQK3D6WQEdlC7rO7sdaZgrrXFxJ4sHsVAgSQ46/uERFxw
         MBeg==
X-Gm-Message-State: AOJu0YywI/ZuGr4gerNbjVcu5lo3r5aMzRAMl2r2K5OBEmi7kf84vE/m
	sWwJvQubGHoJ92dGIZZoU75cIkXZJFmk41zYmfFcf/g04Bw6mgKo0RbYLHlf
X-Google-Smtp-Source: AGHT+IHDaaulqNMZFIiqXOUs+eU4dqhKPKaQe7dmqClMpRby6mSkBbEjHkITuea8TQXTlczL8BaXWg==
X-Received: by 2002:a17:903:90c:b0:20c:9821:69af with SMTP id d9443c01a7336-210c6c90a40mr70235ad.45.1729879922359;
        Fri, 25 Oct 2024 11:12:02 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e755sm11982465ad.194.2024.10.25.11.12.01
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:12:01 -0700 (PDT)
From: Josey Swihart <naghamtony726256@gmail.com>
X-Google-Original-From: Josey Swihart <joswihart@outlook.com>
Message-ID: <e9d97d3af160ab8e6f0d8d68629a35d1d313c6c77e31c3da61bd9eff1f464814@mx.google.com>
Reply-To: joswihart@outlook.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Yamaha Piano!
Date: Fri, 25 Oct 2024 14:12:00 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I am reaching out once more about my late husband?s Yamaha piano, which i am offering to anyone who would genuinely cherish it. If you or someone you know would be interested in receiving this instrument as a gift, please feel free to get in touch.

Warm regards,
Josey
