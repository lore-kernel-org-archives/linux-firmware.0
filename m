Return-Path: <SRS0=7nf9=5S=gmail.com=zenmchen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0835DCCFA1A
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Nov 2025 05:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6654C19424; Mon, 10 Nov 2025 05:35:47 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB89FC4CEF5
	for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 05:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB89FC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so1816705a91.3
        for <linux-firmware@kernel.org>; Sun, 09 Nov 2025 21:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762752946; x=1763357746; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYJgqhZIOBvKJVWqUmqJI1wlrcUfx/aVWtAbOVWPzJg=;
        b=M1IUOtKVmg33e3AjEJO29fCkmV48EvIvZrbk+U82jMLTBPqVx+Ci3P5sLiujPEMyjR
         D0L+52HlqQAPhKqs3sjkWHAoI3dq/xwybNDuLZzAO6SCdHyMYhjcll1VGWkxXTGup7iz
         AQv5FoypaQq9AltuYZBXZqaMyjRgkJXWRkosINlTLvXPRl7o4kiM1Q14z/ezrewmE+qu
         AaQSLFvU3VIArrI7oCNJBrX7T12C+RRjH9XZJ8MjEEqCExpONpYK2G/DMxwwFcfOUMUk
         e0AoHDMqJ919re2r7ued35vR2s/DP/POM68rW9i8rLNekEdZpoJ/RweNJTaFkZlllkpT
         HOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762752946; x=1763357746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYJgqhZIOBvKJVWqUmqJI1wlrcUfx/aVWtAbOVWPzJg=;
        b=dT1jB7pWxsOCCjAlxPmcl7xfyygIMqLKJXi7us5W6ACRFgu+lqXMXsdXWlWrEqidIL
         NdpeiHnfwxmSUDaHF3U2+rq5zJBVMfR3WL6+6wBqDF5cBtjeVxy3ATYyd0d7CquKdzvp
         ic2ro2DeXZDFPHojb2f1QsR2H0A/KOSteWsJ7VIVZVP888UMWj6uOaGb6HCg8Lc9C6NC
         R4MfDGLRz/GOV4Y6s9OnIhc/h1MWciWBFSFn2H791Zps3XfittBaTpX72oy4EqG+U6qv
         1YI+uZRe92VFR+Z2iQYtELbo8LOuwF/eH2KgsJx7WuleBFiNUD2gdToIEpKECFxxu2V6
         mNmw==
X-Gm-Message-State: AOJu0YxCLsCM/G/MPa7AGKRV4wwsQGJ50SQ8nzvnahE9aImZDL5XJJRM
	4fZrLr146KNw9webIYrgQRd2p86PVsSzG/ftMbNX0Uf9mR6CGfkUdyNY
X-Gm-Gg: ASbGncvbkkpeU7Th/oVVwNPDxmX78Z4G17psSiPFSj7XaXwiq44Xvov/m2U6c8kooWj
	TpHvxzMKEs+FOpKyCf4CZ0RVrAyR1OrDjoqEiqfI7PiKBQtC27U+353VCfWLbTduTh7/bsNr4mq
	kGLaq6dfc1D7RGxhkEK3ymdJD9zspEM0X9hT+khp+GA8h9EU1gBq9MwgrROBkfIKT7cMW1NfxAp
	7xZAcOSU5STXznv868lmm1ej4eQZ+kmzXKCZieRx+RFs1bNcT1sYFjaVoPlJ0jcfa++lJVzJbUd
	vRCAEnuobWBryCJCcNSoO2gZg3boASYgerG06tbPqrjJbdYwdyZX8FEW30yOTXCzqGYsQ99QFcn
	1oj+R+EYGMbZnIVU10D2RhtPC7MvV76poksBHKBjMv+2b+orxRvG4NJ7R8a1BlKwHyjEaNDJT5Q
	x+4sg9J6kUi7KXzDxMUJOg02LnYrK0Mg==
X-Google-Smtp-Source: AGHT+IFniahBLvylrClav1dInmN/p9U4AlssrMq4ikykN++jHarUYZyEymmp959RhYEEeAJ2Q5rL9w==
X-Received: by 2002:a17:90b:2d10:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-3436caa6ba3mr9028250a91.0.1762752946048;
        Sun, 09 Nov 2025 21:35:46 -0800 (PST)
Received: from BM5220 (118-232-8-190.dynamic.kbronet.com.tw. [118.232.8.190])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-341a699d6dfsm16397675a91.16.2025.11.09.21.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 21:35:45 -0800 (PST)
From: Zenm Chen <zenmchen@gmail.com>
To: pkshih@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	rtl8821cerfe2@gmail.com,
	zenmchen@gmail.com
Subject: RE: [PATCH] rtw88: 8822b: Update firmware to v30.20.0
Date: Mon, 10 Nov 2025 13:35:36 +0800
Message-ID: <20251110053540.4557-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <aa1a0c67256f416584c9099496cc2aff@realtek.com>
References: <aa1a0c67256f416584c9099496cc2aff@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ping-Ke Shih <pkshih@realtek.com> 於 2025年11月10日 週一 上午11:03寫道：
>
> Zenm Chen <zenmchen@gmail.com> wrote:
> > Sent: Monday, November 10, 2025 7:03 AM
> > This firmware was extracted from the vendor driver for RTL88x2BU
> > v5.13.1-30-g37e60b26a.20220819_COEX20220812-18317b7b from
> > https://github.com/RinCat/RTL88x2BU-Linux-Driver
> >
> > Signed-off-by: Zenm Chen <zenmchen@gmail.com>
>
> I confirmed the binary is identical as release version, so
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
>
> > ---
> > Some people said this firmware fixed certain problems [1][2], so upstream it.
> > Only tested with RTL8822BU, NOT SURE IF RTL8822BE/RTL8822BS WORK FINE
> > WITH IT.
>
> I tested RTL8822BE and no obvious fault.
>
> Look back into vendor driver, all interfaces use the same firmware, so I
> think it will be fine.
>

Hi Ping-Ke,

Thank you for your testing and confirmation!
