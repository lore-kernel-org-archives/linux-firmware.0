Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA11C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 117C5C433A8; Tue,  7 Mar 2023 14:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0708C433A4
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200542;
	bh=gdAtCeszaaUdeW5GKS3drFHQ9+ma4TCxn5KF8ZPZ1iY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DBh2HKjxnQkJ0Cj0DFdFDmJnAJyw2LLSGc6Q9fuCWIunP41uUFb6RENMMUYupu42W
	 2qEJ9+aGxnEa1dz1SKGdiE5t57gQ/ezUpR0JByWxpmCY0XNUiqPG2J0HbVTHtO1U4y
	 8NYGgDJ1RliuboWrLEyaO3H9CMo2y+mbgWAcAoDFQhiG0cSedot3SOrRu0Jy0JqEZV
	 9rDlt//91Sz2ATL/HWg8sxyIals+e1y+6MM3e411H/qWDQRXGNMMdhJe59oUMItYFg
	 D5fNEAgfJ409LzKMRKXj57j6m4TeHXWspZa7zSdIzubIdGS6wozxBNqN+L3G6waY5X
	 xGFHMDdgXwzrg==
Received: by mail-yb1-f173.google.com with SMTP id i6so11604180ybu.8
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:49:01 -0800 (PST)
X-Gm-Message-State: AO0yUKUwupR+7T1kRM0khCvQF8zeiy7CJJrwWhLja80W2UdCq3Jn0qvV
	+GAimwRtUQEWMruyiyq+Ni9pCRVuXBeV3z4oGOM=
X-Google-Smtp-Source: AK7set9YIyhE+2PxgvaLYDCcCstuj3TuFGioKSXSNNN3lRef0FXGyy7hny+ejOeX+HLN9sKnXzeZSj/yAwNTweccG0o=
X-Received: by 2002:a5b:c11:0:b0:acc:533b:9451 with SMTP id
 f17-20020a5b0c11000000b00acc533b9451mr8900413ybq.0.1678200541021; Tue, 07 Mar
 2023 06:49:01 -0800 (PST)
MIME-Version: 1.0
References: <be7951b30f40d753910e607791b20ed4e041023b.camel@intel.com>
In-Reply-To: <be7951b30f40d753910e607791b20ed4e041023b.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:48:50 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5avqwk8vR8NSaJ31aOj-HHFM65qHwV+XZFhm6WWhHGYw@mail.gmail.com>
Message-ID: <CA+5PVA5avqwk8vR8NSaJ31aOj-HHFM65qHwV+XZFhm6WWhHGYw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-03-06
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 6, 2023 at 10:24=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains updated firmwares for Ty device for our currently maintaine=
d FW binaries.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Gregory
>
>
> The following changes since commit 60971a6485ee604c47cc905ff77c583ae001f9=
df:
>
>   Merge branch 'liquidio-20230222' of https://github.com/dchickles/linux-=
firmware (2023-02-27 12:33:07 -0500)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-03-06

Pulled and pushed out.

josh

> for you to fetch changes up to 4309412c0d872897dc913c7d2797bb5ce05893ad:
>
>   iwlwifi: update core69 and core72 firmwares for Ty device (2023-03-06 1=
7:12:36 +0200)
>
> ----------------------------------------------------------------
> Update Ty firmwares with the recent fixes.
>
> Revision: daa05125 (core69)
>           fe17486e (core72)
>
> ----------------------------------------------------------------
> Gregory Greenman (1):
>       iwlwifi: update core69 and core72 firmwares for Ty device
>
>  WHENCE                       |   4 ++--
>  iwlwifi-ty-a0-gf-a0-72.ucode | Bin 1499284 -> 1499284 bytes
>  iwlwifi-ty-a0-gf-a0-74.ucode | Bin 1533444 -> 1533444 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
