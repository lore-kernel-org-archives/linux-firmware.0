Return-Path: <SRS0=WglV=J2=gmail.com=rishabhmishra98359@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03163C48BC3
	for <linux-firmware@archiver.kernel.org>; Sat, 17 Feb 2024 19:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8048C433C7; Sat, 17 Feb 2024 19:42:54 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06171C43390
	for <linux-firmware@kernel.org>; Sat, 17 Feb 2024 19:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06171C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-511acd26c2bso4415431e87.2
        for <linux-firmware@kernel.org>; Sat, 17 Feb 2024 11:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708198972; x=1708803772; darn=kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=d9cH4y4oWfUum3HhwVW2ajdovg2dl1jZngBJDj3u9QA4yPLja0sH4/SnUZO6P+o3Mn
         kW8y/0vkLy06juL9r4PLh4utpNCj/WYTbqamzIeBIYC5WF6ak3YvAMgIuD0FFBhG49/+
         X9jT2bl1mXjQ7K0XNl+B2jvibzIwU9Yc+9CD12sy0JyWjZHgOnxC4L4V7WS3KF1Yy+sc
         0Fs+RdoQ6pnGU4nchOSeymtwCuFGOFtwKGKAjVYuA1wLHrD6V6knHsAnWEY+TUdeixuo
         ZH4wRgRlUeGeTz1eitIdT0gxok2b2rwsbI67nR4KF7dIpH7kmvRMdILZudXDJ9eTJPU2
         XJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708198972; x=1708803772;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=hRdTO0gBjYVPMMsCn6QyJ8J83svYzTL3P2jsQECmwVzEMA/l6lE7RzDGt0IIb0Bb1H
         jU5Rz0/mXjsjuRjAf3QLNC8/GV4yU2BsLWBKM0fg20Qkv3FdjiKpEWGw6l7OHpADaN3u
         ZBzJnE0W51KtQHZGVrxkLGHB2/eHjRf5kDSTbMTPjmzvX7IzmX+Ou5HRB3GkPfxxaKTt
         Jrq1KmaTfvkN2yFwW4ttAODY70pgRrEcA+9kM0oAgvqL7ik3A/irOI7DiGNuDL3TbUrm
         4F3MWu1tYcfy8y3u8XYFRx7/9GRmsmYm39VoPqdAJDYo98TipjxOYqzFE7ESFzKEjpNe
         4jiQ==
X-Gm-Message-State: AOJu0YyyNRx6+wWU+Q7stkB1Vi+P9clR7vGD4ScRYjAXidNi4ye7VRQ8
	DhVzXE/hQNay6YZCWTJguYCOVq8oIxNnIAHDcGnD2BR0SlFrS1XBVSGHSECV
X-Google-Smtp-Source: AGHT+IHVMQETDV9eJjspJs16RR7x2Gepx7r6gBLwB58JvR/NtOSr+u9HyhMb7bUiTSftJgKUj9CQHA==
X-Received: by 2002:ac2:4145:0:b0:511:7021:9418 with SMTP id c5-20020ac24145000000b0051170219418mr5234503lfi.69.1708198971948;
        Sat, 17 Feb 2024 11:42:51 -0800 (PST)
Received: from [185.222.57.68] ([185.222.57.68])
        by smtp.gmail.com with ESMTPSA id qo8-20020a170907874800b00a3e4fc3919esm310001ejc.31.2024.02.17.11.42.51
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Feb 2024 11:42:51 -0800 (PST)
From: Teri Ford <rishabhmishra98359@gmail.com>
X-Google-Original-From: Teri Ford <terrford@outlook.com>
Message-ID: <eb82c754e417aaf10a16f027e047c1a2b24e244154b339c68748efc442069ccc@mx.google.com>
Reply-To: terrford@hotmail.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: ` ` Piano ` `
Date: Sat, 17 Feb 2024 19:42:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I'm giving out my late husband's Yamaha Baby Grand Piano for free to any passionate instrument lover. kindly let me know if you want it or have someone else who wants it.

Thanks,
Teri
