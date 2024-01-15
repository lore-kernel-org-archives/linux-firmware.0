Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98126C4707B
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jan 2024 12:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A282C433C7; Mon, 15 Jan 2024 12:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A41C433A6
	for <linux-firmware@kernel.org>; Mon, 15 Jan 2024 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705322306;
	bh=1/HRi7zvPfmh/Bm+vz+BG3xyQYAjE5QarrS/SWi3RmI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=cOc0h9CEUI51kFJHVHHxJ3XbrXf0F607WgUPR/vPebvR8mNhBPP2c2Wc3zwNjUkCu
	 UgdFYrrauTzW+yyzCidwJF9HSlHMH4VxckZnyp4SuejHu/Di2XK+Osl3zGqUb9ep/U
	 N9wE9A35cMTmuZKPxYGDVAktFyhSop78X+7E2Y1em7TRdnQigb3/WxjTcyMZ0oYBwM
	 IOo9tq4yTd+j8y1XmFUFz0e1xAKEUBnPIRklXziawIEYce8HAniHghnYeCZnJNfHxg
	 FYUHdHOWAtp8N94xfxpdcZea2Q5V01tmup9rQYBsp3mo+RnmXv1gPyCSOeX7niLoVx
	 i7Qr3oSQfmAVg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5efb0e180f0so85917647b3.1
        for <linux-firmware@kernel.org>; Mon, 15 Jan 2024 04:38:26 -0800 (PST)
X-Gm-Message-State: AOJu0YwseLae9ct619EytlqDAJ0almdSBBXsF3E6xqQM0iSqitA1b6DF
	7zV5FCstzMlNZGmRWMjUzBTxgW6GFkkLcUbmDQM=
X-Google-Smtp-Source: AGHT+IF4iuh4nnUUyq7eprLsHM0nNJCq9/qpKDtCC+NmUBki7yO5ysb0MGB9uj8cDFVd9Q5gnlgG0HLf/PF/YZhz9+I=
X-Received: by 2002:a05:690c:f8f:b0:5f6:d80b:674a with SMTP id
 df15-20020a05690c0f8f00b005f6d80b674amr3903136ywb.27.1705322305484; Mon, 15
 Jan 2024 04:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20240108170254.GK14858@ediswmail.ad.cirrus.com>
In-Reply-To: <20240108170254.GK14858@ediswmail.ad.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Jan 2024 07:38:14 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6pvpMJP_nOf3cJByJLHCM1TPc4sqhgrzZssQ-isiHy7A@mail.gmail.com>
Message-ID: <CA+5PVA6pvpMJP_nOf3cJByJLHCM1TPc4sqhgrzZssQ-isiHy7A@mail.gmail.com>
Subject: Re: [PULL linux-firmware] Add firmware for Cirrus cs42l43 codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 12:03=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> We would like to merge the firmware for the cs42l43 codec, this
> firmware requires some additional license details to cover code
> used within the firmware.
>
> Thanks,
> Charles
>
> The following changes since commit 5179d3558a336a270b38555579252ec81073ee=
5c:
>
>   Merge branch 'robot/pr-0-1704729100' into 'main' (2024-01-08 16:16:40 +=
0000)
>
> are available in the Git repository at:
>
>   git@github.com:CirrusLogic/linux-firmware.git cs42l43

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/127

josh

>
> for you to fetch changes up to b620ad7f5def0f6b3f0c82300685a76f410b4d51:
>
>   cirrus: Add firmware file for cs42l43 (2024-01-08 16:20:30 +0000)
>
> ----------------------------------------------------------------
> Charles Keepax (1):
>       cirrus: Add firmware file for cs42l43
>
>  LICENSE.cirrus | 310 +++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++
>  WHENCE         |  14 ++++
>  cs42l43.bin    | Bin 0 -> 560 bytes
>  3 files changed, 324 insertions(+)
>  create mode 100755 cs42l43.bin
