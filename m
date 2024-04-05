Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEC5C67861
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Apr 2024 16:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A83E1C43390; Fri,  5 Apr 2024 16:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DBBC433C7
	for <linux-firmware@kernel.org>; Fri,  5 Apr 2024 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712333706;
	bh=DJw3zw8NNTM5McOky/pZUalbATR6qhk/DX4jkK0rDmk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bCj2SFzryKEJ23sgVV1XEEFPZampKhGoaXhvCzmuuaHCM62La73lnG3Tu7u3Q0KHI
	 UvOH090lO/vhIeC4T1GBErTju2WqT9yqz8uc5wAQJnZl8zceyuWxGclJDdmEyCeX3m
	 fSzs+y9oDi4IQHsL3tlfmEWjp3nJNoxpq+ZyPXlH3xhQyPdbZKRNzFezu6hl7kBR9R
	 q4Ipspm3jS8cubUz/wf0FmFpPJbZp6KJFP1VqBoXgT8aE/LcnuCcz9PRCRR4S20jSf
	 Hb2Jjj+pMg2DaQR4HDxd7K/20AC2XcNcpB4TfZo3+161qXoTP6AYw11+VtuHIHNvEs
	 2PWuFwI+3qz8Q==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6152be7c58bso25158767b3.0
        for <linux-firmware@kernel.org>; Fri, 05 Apr 2024 09:15:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMrROlmtm8z+kYmPrkBPhB+lJpCb8D1zmXYdW7Lj2dPVdM/BmZ
	ISBPnB/7Sz7I6FI7x2wo7IfYziUEguqO6YCRuyjjgfDlQin+ZIy1C4h4K4Onf0Em31rJs+Qe1vt
	1q1fD8egzOHKINRUcnqoSt0cDKok=
X-Google-Smtp-Source: AGHT+IEuKTApqEnI3qBWaExsH8Nbv7g0q9bIo7kzhh6VG0aWT00Hc771dwQ8OrdC6dUD0nQ0ABwvz5oEWsQVkZwE+vA=
X-Received: by 2002:a25:a50a:0:b0:dd1:398b:3f33 with SMTP id
 h10-20020a25a50a000000b00dd1398b3f33mr1611996ybi.16.1712333705786; Fri, 05
 Apr 2024 09:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240325144042.2657222-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240325144042.2657222-1-chiahsuan.chung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 5 Apr 2024 12:14:55 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4n756svi0uTUtVGYrdmHCugsbznHfLrfG0C5HOTkvi5g@mail.gmail.com>
Message-ID: <CA+5PVA4n756svi0uTUtVGYrdmHCugsbznHfLrfG0C5HOTkvi5g@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.210.0
To: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 10:40=E2=80=AFAM Tom Chung <chiahsuan.chung@amd.com=
> wrote:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-25 22:30:12 +08=
00)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-03-25

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/187

josh

>
> for you to fetch changes up to d9876ab4e6943640f497f314679db341821bcfe2:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-25 22:30:12 +08=
00)
>
> ----------------------------------------------------------------
