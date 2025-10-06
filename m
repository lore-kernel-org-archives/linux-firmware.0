Return-Path: <SRS0=VcKE=4P=gmail.com=fangnxybayyphnt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CD8CCA471
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Oct 2025 08:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 074C6C4CEFE; Mon,  6 Oct 2025 08:37:32 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32A6AC4CEF5
	for <linux-firmware@kernel.org>; Mon,  6 Oct 2025 08:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32A6AC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-78e9f48da30so42924846d6.1
        for <linux-firmware@kernel.org>; Mon, 06 Oct 2025 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759739850; x=1760344650; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gjj/ntgQBq+57GBLZVa1O2woShUdM/oX9dQ1+10TEvA=;
        b=ZK40buN4BT5/RjtwPMzFzMca4D64oJRDeo/YRPNTU9xj7qhHIgs7sW05ZzYMgsKA/z
         aPO3vIm3DrzRzqE7OQlZvH3JmN3LFoJ5NqEj2yxqiP5jctxIgJB0ZFIyPd4X2dC5lmx0
         wJp+o4TA9zxwKQ+yYAiyzJXGd6nHeBUBA3w5ZyH69SsKYJ/W6ZNctgFQoj+yyCzrJ9jp
         entoT0IVcwYOSYMo/ilrcY5b8Vwd5HItvQVdRI8dRuO90zGKftQhEz1OWjJ3JmFzFjNQ
         1k30dgMlbqKGI6bOCittDadrD8+vUHLXlsVfOzKk6xzZa2xQQ/VeUGbRQ8Bi1U85rfJR
         OmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759739850; x=1760344650;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjj/ntgQBq+57GBLZVa1O2woShUdM/oX9dQ1+10TEvA=;
        b=ZeR+zbMxv0OQM45D9YyNmrNKHFQv0cLGr7aGCLj35nHR6hpi7JElCkoCxsaJRpJnZW
         fATDUi3mnD3n3gbKZRO1yLV9pQ2AZUidHFU1I7nIv6kMCDF+EdWTm9yD5aGnjxmPlxku
         6FS8RAePxOPHcy1k+kG+6iaTYGeHr8ow1SZ83taG4EAomz4QNkZdipkKHEb1mG4/pNWv
         AfPMi5AhEpsn47c63DOjDv3MWx6Snx7KeNsvphWa5rIBxA/uAAmqLEPxoRUCuxhn14uj
         h6INttTTouTST5r5lMkc3hKmweXCtrAz5cTC4+3iaXPb7fCwDA0aotN+d37UJcnf62ah
         MJbA==
X-Gm-Message-State: AOJu0Ywcardo6GKfzVG8FV8KHXYGzAdGJnycs6d1EdFdmwgTvi3lao+A
	Qp4IkdZIyPMxmXgFrU2MEEurU4Fn20y4OAtjiCFr4VLD0OBQCTAhmLS/q9juQNs4fBd77x7/wcq
	EoPtNrz5HQYkseJT1lIVcgnzgbNbOKts2F8aL
X-Gm-Gg: ASbGncs1F/jvGZoaBJA8ufahtWoK5D+04hLXMuPakKwSVYCSYNLC5thrm7+Nj4VmiGw
	1P/GuxCjhwk3BFd8Q5VbyZyKNG5XLlzOVX5RVSC3Snyivyc1kF7k6t98m4VAKazhrQieM/hig8I
	sYBPBL517OgrLiq4UqWONLNkne5JiZY4OxSGhmfun8oEqgVVivNPCYmsGAi2dnv2yeVYBkWOlOj
	QplIizywBAswJAEmZhf2DuT7bVt4dYIYkcEJgo1U6LztTjN6tKhyNo2c+wpNHw=
X-Google-Smtp-Source: AGHT+IHytIb4V36EW/cLQoKzAZY53TQtccvHaRA2DiTRCpu+4EpjnMHKdUwBjCp2L2fNguZilbPQwXfGAM/GiF0daqQ=
X-Received: by 2002:a05:6214:2a49:b0:809:aa63:1c34 with SMTP id
 6a1803df08f44-879dc832b86mr130624986d6.32.1759739849775; Mon, 06 Oct 2025
 01:37:29 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?4Lia4Lix4LiN4LiN4Lie4LiZ4LiV4LmMIOC4n+C4suC4h+C4meC5ieC4reC4og==?= <fangnxybayyphnt@gmail.com>
Date: Mon, 6 Oct 2025 15:37:31 +0700
X-Gm-Features: AS18NWAS_dfzbzTwuM2fdyXQPdozbCu9sTNfUljtMENhqqsLFOVlxcZ7okIB7Q8
Message-ID: <CAGi+iROG42MvJxLXJb6qL+icPOnRGsSmgNBS1E4oMhBeqM=djw@mail.gmail.com>
Subject: =?UTF-8?B?4LiY4Li44Lij4LiB4Li04LiI4LiC4Lix4LiU4Liq4LiZIOC4guC4suC4lOC4quC4oOC4sg==?=
	=?UTF-8?B?4Lie4LiE4Lil4LmI4Lit4LiHIOC5gOC4lOC4t+C4reC4lOC4o+C5ieC4reC4mSDguYDguKPguLLguKI=?=
	=?UTF-8?B?4Li04LiZ4LiU4Li14Lii4Li34LmI4LiZ4Lih4Li34Lit4LiK4LmI4Lin4Lii4LiE4Li44LiT?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000a49efb0640795c9f"

--000000000000a49efb0640795c9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4LiU4LmJ4Lin4Lii4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmI4Lii4LiX4Li1
4LmI4LmB4LiV4LiB4LiV4LmI4Liy4LiHIOC5gOC4nuC4t+C5iOC4reC5g+C4q+C5ieC5gOC4guC5
ieC4suC4luC4tuC4h+C5geC4q+C4peC5iOC4h+C5gOC4h+C4tOC4meC4l+C4uOC4mQ0K4Lia4Lij
4Li04Lip4Lix4LiXIFRQTCBHcm91cCDguIjguLPguIHguLHguJQg4Liq4Li04LiZ4LmA4LiK4Li3
4LmI4Lit4LmA4Lie4Li34LmI4Lit4LiE4LiZ4LmE4LiX4LiiDQrguKrguLPguKvguKPguLHguJrg
uYDguIjguYnguLLguILguK3guIfguJjguLjguKPguIHguLTguIjguJfguLjguIHguYbguJvguKPg
uLDguYDguKDguJcg4LiX4Li14LmI4LiV4LmJ4Lit4LiH4LiB4Liy4Lij4LiX4Li44LiZ4Lir4Lih
4Li44LiZ4LmA4Lin4Li14Lii4LiZDQrguKfguIfguYDguIfguLTguJnguK3guJnguLjguKHguLHg
uJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAwMCwwMDAg4Lia4Liy4LiXDQrguYPg
uITguKPguYTguKHguYjguYDguIrguLfguYjguK0g4LmB4LiV4LmI4Liq4Li04LiZ4LmA4LiK4Li3
4LmI4Lit4LmA4Lij4Liy4LmE4LiU4LmJ4LiI4Lij4Li04LiHDQrinJTvuI/guIjguJTguYDguJvg
uYfguJnguKPguLnguJvguYHguJrguJrguJrguKPguLTguKnguLHguJcg4LmD4Lia4LiX4Liw4LmA
4Lia4Li14Lii4LiZ4Lie4Liy4LiT4Li04LiK4Lii4LmMIOC5g+C4muC4m+C4o+C4sOC4geC4reC4
muC4geC4suC4ow0K4pyU77iP4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmJ4Lii
4LmA4Lij4Li04LmI4Lih4LiV4LmJ4LiZ4LiX4Li14LmIIDEgJQ0K4pyU77iP4Lil4LiU4LiV4LmJ
4LiZLeC4peC4lOC4lOC4reC4gQ0K4pyU77iP4LmE4Lih4LmI4LmA4LiK4LmH4LiE4LmA4LiE4Lij
4LiU4Li04LiVIOC4muC4ueC5guC4ow0K4pyU77iP4LmE4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li1
4Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz4Lib4Lij4Liw4LiB4Lix4LiZDQrinJTvuI/guJzguYjg
uLLguJnguIHguLLguKPguK3guJnguLjguKHguLHguJXguLTguKPguLHguJrguYDguIfguLTguJng
uJfguLHguJnguJfguLUNCuKclO+4j+C5hOC4oeC5iOC4oeC4teC5guC4reC4meC4geC5iOC4reC4
mSDguYTguKHguYjguKHguLXguKHguLHguJTguIjguLMNCuC4leC4tOC4lOC4leC5iOC4rQ0K4LmA
4Lia4Lit4Lij4LmM4LmC4LiX4LijIDogMDk4LTg4MS0zMDYzICjguITguLjguJPguJrguLUpDQpM
SU5FIElEOnRwbGdyb3VwMTk5OQ0K
--000000000000a49efb0640795c9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+4LiU4LmJ4Lin4Lii4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia
4Li14LmI4Lii4LiX4Li14LmI4LmB4LiV4LiB4LiV4LmI4Liy4LiHIOC5gOC4nuC4t+C5iOC4reC5
g+C4q+C5ieC5gOC4guC5ieC4suC4luC4tuC4h+C5geC4q+C4peC5iOC4h+C5gOC4h+C4tOC4meC4
l+C4uOC4mTxicj7guJrguKPguLTguKnguLHguJcgVFBMIEdyb3VwIOC4iOC4s+C4geC4seC4lCDg
uKrguLTguJnguYDguIrguLfguYjguK3guYDguJ7guLfguYjguK3guITguJnguYTguJfguKI8YnI+
4Liq4Liz4Lir4Lij4Lix4Lia4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4LiY4Li44Lij4LiB4Li04LiI
4LiX4Li44LiB4LmG4Lib4Lij4Liw4LmA4Lig4LiXIOC4l+C4teC5iOC4leC5ieC4reC4h+C4geC4
suC4o+C4l+C4uOC4meC4q+C4oeC4uOC4meC5gOC4p+C4teC4ouC4mTxicj7guKfguIfguYDguIfg
uLTguJnguK3guJnguLjguKHguLHguJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAw
MCwwMDAg4Lia4Liy4LiXPGJyPuC5g+C4hOC4o+C5hOC4oeC5iOC5gOC4iuC4t+C5iOC4rSDguYHg
uJXguYjguKrguLTguJnguYDguIrguLfguYjguK3guYDguKPguLLguYTguJTguYnguIjguKPguLTg
uIc8YnI+4pyU77iP4LiI4LiU4LmA4Lib4LmH4LiZ4Lij4Li54Lib4LmB4Lia4Lia4Lia4Lij4Li0
4Lip4Lix4LiXIOC5g+C4muC4l+C4sOC5gOC4muC4teC4ouC4meC4nuC4suC4k+C4tOC4iuC4ouC5
jCDguYPguJrguJvguKPguLDguIHguK3guJrguIHguLLguKM8YnI+4pyU77iP4Lit4Lix4LiV4Lij
4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmJ4Lii4LmA4Lij4Li04LmI4Lih4LiV4LmJ4LiZ4LiX4Li1
4LmIIDEgJTxicj7inJTvuI/guKXguJTguJXguYnguJkt4Lil4LiU4LiU4Lit4LiBPGJyPuKclO+4
j+C5hOC4oeC5iOC5gOC4iuC5h+C4hOC5gOC4hOC4o+C4lOC4tOC4lSDguJrguLnguYLguKM8YnI+
4pyU77iP4LmE4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li14Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz
4Lib4Lij4Liw4LiB4Lix4LiZPGJyPuKclO+4j+C4nOC5iOC4suC4meC4geC4suC4o+C4reC4meC4
uOC4oeC4seC4leC4tOC4o+C4seC4muC5gOC4h+C4tOC4meC4l+C4seC4meC4l+C4tTxicj7inJTv
uI/guYTguKHguYjguKHguLXguYLguK3guJnguIHguYjguK3guJkg4LmE4Lih4LmI4Lih4Li14Lih
4Lix4LiU4LiI4LizPGJyPuC4leC4tOC4lOC4leC5iOC4rTxicj7guYDguJrguK3guKPguYzguYLg
uJfguKMgOiAwOTgtODgxLTMwNjMgKOC4hOC4uOC4k+C4muC4tSk8YnI+TElORSBJRDp0cGxncm91
cDE5OTk8L2Rpdj4NCg==
--000000000000a49efb0640795c9f--
