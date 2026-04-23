Return-Path: <sean.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0C8FDEE32
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 17:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5DD4C2BCF7; Thu, 23 Apr 2026 17:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07C2C2BCC9
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965674;
	bh=tz3OwM6ZqtXTE234+rrZJXeoUNgJ9jOHjfV583YpF8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NWnkHW7CQHMqiMxwIcbqflDGH0mDDXIkp94zC2grKfec1rr9KSC+KgU5DO4Xj3I/I
	 aWXFUdG9vMH9PDVLtufNMT7/yIBRPumliKni7QAsfwbCRQSLh01/XnhN+DQqyH1Xwi
	 FsDqWRY3WvjB17UoRrHCLfYgx9/dpVhz89xk3c/gqiKUafuiexeaYs3BVLKtJqFZHC
	 RpIqlRvIoXfsgzlYt6z3OGg3mIXNS9pUTP45cuezKBx50YmSbforkBCZ8F0h08Ebj4
	 1ykYlgYz9a5HDxl+6xzMuspzjD449yIDHpdYi1fZyMgjH3sCr4a+RiRvM7xcpyJkRE
	 yYaC0gGyHJjuw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38ddeb0f5abso53080341fa.3
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 10:34:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8aAbqlYj7buFfzNyWs7Qs6zjj8+kFVv2zF2F6AUnLoT9zWR+PgFpmF1nY6WF3ZS40dnOmpRM0sOJqP5gzyzg==@kernel.org
X-Gm-Message-State: AOJu0Yy2/cU7ufXrpV6XagJ0mY1cXVlb0HL9Jm7aQfjClsDLOgjTnxwB
	qH0UJimOggf834biPEJBYSfWGLnMBTv/ukYlblaoK+0DFkyOTsqR45TSsQJSUZBQmp8kaPZ+G45
	aQ9H5brX3thPijeYKMB9HUKbICQ9LJso=
X-Received: by 2002:a05:6512:2308:b0:5a4:2cf:601e with SMTP id
 2adb3069b0e04-5a4172c3f7fmr8750846e87.12.1776965672922; Thu, 23 Apr 2026
 10:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAKHmtrRD35fnE_TsZHzfgQ5p7=WHE1Fz8wnV0t2SGxDcgmopjQ@mail.gmail.com>
In-Reply-To: <CAKHmtrRD35fnE_TsZHzfgQ5p7=WHE1Fz8wnV0t2SGxDcgmopjQ@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 23 Apr 2026 12:34:20 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzq2HKHCpzG=rXjvQa=aORPRYvpEjsUnqsc6jDvwNMtB7g@mail.gmail.com>
X-Gm-Features: AQROBzAlw-9F3viDRFk4zHZKcR0uIDtWqMO3nL-w00vYCJ1t3Wo4hMiO16cNv8c
Message-ID: <CAGp9Lzq2HKHCpzG=rXjvQa=aORPRYvpEjsUnqsc6jDvwNMtB7g@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7925 WiFi device
To: David Ruth <druth@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jb.tsai@mediatek.com, Leon Yen <Leon.Yen@mediatek.com>, ben@decadent.org.uk, 
	=?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <chris.lu@mediatek.com>, 
	dwmw2@infradead.org, jwboyer@kernel.org, linux-firmware@kernel.org, 
	linux-kernel@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, litien.chang@mediatek.com, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Quan Zhou <quan.zhou@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1015

On Wed, Apr 22, 2026 at 5:22=E2=80=AFPM David Ruth <druth@chromium.org> wro=
te:
>
> Tested-by: David Ruth <druth@chromium.org>
>
