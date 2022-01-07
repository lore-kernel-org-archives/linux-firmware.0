Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C19C433F5
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Jan 2022 12:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7181EC36AEF; Fri,  7 Jan 2022 12:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B421C36AE0
	for <linux-firmware@kernel.org>; Fri,  7 Jan 2022 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641558057;
	bh=bwkqrpRoFOFdWCKUjlRgGuxEFsj/DVHBOM4zz12bTzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gnFAadOAg9KRYF3yHOmQvEjZ+R//8i3/zTfraX+aw6O3lGPYZNzbvGItFBtJBTlpl
	 4dlE60hUXEYm+q6yT5dSabk3oJXHiR4q074xe2AT9RzFfcoCKZtBMOD7Qk3eCyBCIK
	 jLN7yTjG+UEkJonhkKvaouS6UC/gDOtt7FHrEM4YVype43NfzCUAyJ4ChbfkrVFVFv
	 +2amkOoyV+ozsZkMHtkGgIx91ynO497tfv5VzoMxNMNYLxsfR5UMbQiI0r1Qc7OlLJ
	 hZOQmjhPX8QTAx85N6ZagAu/Kdby1pkTy2P0YESOcnhgtAHBaL8WRrZC3HzmJ9azef
	 raCWH0UQ+vZcA==
Received: by mail-io1-f41.google.com with SMTP id x6so6773956iol.13
        for <linux-firmware@kernel.org>; Fri, 07 Jan 2022 04:20:57 -0800 (PST)
X-Gm-Message-State: AOAM533iZ8MhgaUEBortmnasRYvQUYUVmdO/fdta7b5xTVbUhLn601CZ
	gLBZvhBcqfIP7ABUiHjKjD077uoJtcDjCqgZ7H8=
X-Google-Smtp-Source: ABdhPJyYbfuP4jbmre2Rn+CBNYehhmCyneoOpzCWpA5gSp3piA9KEMdQzYhl5QtzmHXxmZm0hyJJFDoDJ/x6o52cjqg=
X-Received: by 2002:a05:6602:2f09:: with SMTP id q9mr2693534iow.55.1641558056602;
 Fri, 07 Jan 2022 04:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20220103172319.GA11176@chelsio.com>
In-Reply-To: <20220103172319.GA11176@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Jan 2022 07:20:45 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5nE6ODRs7LygDcDkzP2P+4Vw0cGaC0GJ4BH-XvsVfyPA@mail.gmail.com>
Message-ID: <CA+5PVA5nE6ODRs7LygDcDkzP2P+4Vw0cGaC0GJ4BH-XvsVfyPA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.26.6.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 3, 2022 at 12:27 PM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
> The following changes since commit 57d6b9507e28ac4803ea4aa4dba9592c889d6733:
>
>   cnm: add chips&media wave521c firmware. (2021-12-29 08:43:43 -0500)
>
> are available in the git repository at:
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 9e89f3b81e3258e7bffdc0ed18a5c56b1cbf3e3e:
>
>   cxgb4: Update firmware to revision 1.26.6.0 (2022-01-03 08:37:13 -0800)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.26.6.0
>
>  WHENCE                  |  12 ++++++------
>  cxgb4/t4fw-1.26.4.0.bin | Bin 570880 -> 0 bytes
>  cxgb4/t4fw-1.26.6.0.bin | Bin 0 -> 570880 bytes
>  cxgb4/t5fw-1.26.4.0.bin | Bin 676352 -> 0 bytes
>  cxgb4/t5fw-1.26.6.0.bin | Bin 0 -> 676352 bytes
>  cxgb4/t6fw-1.26.4.0.bin | Bin 729600 -> 0 bytes
>  cxgb4/t6fw-1.26.6.0.bin | Bin 0 -> 729600 bytes
>  7 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 cxgb4/t4fw-1.26.4.0.bin
>  create mode 100644 cxgb4/t4fw-1.26.6.0.bin
>  delete mode 100644 cxgb4/t5fw-1.26.4.0.bin
>  create mode 100644 cxgb4/t5fw-1.26.6.0.bin
>  delete mode 100644 cxgb4/t6fw-1.26.4.0.bin
>  create mode 100644 cxgb4/t6fw-1.26.6.0.bin
