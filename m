Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF4FC369C2
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 14:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E862CC4CEEB; Thu, 24 Apr 2025 14:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31F1C4CEEC
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745504902;
	bh=f/1g5+LOxmhtVYIx5r4ZkcQO6vQr1Li92BSPXdLSkWk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qDRy0zzGuMSqfwaIy00R7D2bnSRsLpk5te6XKVnfqBTWU2nPIc2CxA844GWNqlaOl
	 nzQPhJm9Y8dJXjx2gFeGyZp+cBA1jEnDfa8VYBx13lu1dAc6rwnV9JdOYkllFQpzFN
	 qOkLNpLiWPcpkPH6x7yWffqUwPmpQIoZLXzaq4fyiZgNb/ScV7bV5pog5lMS7kJBEi
	 1krmgWUy5tN/UYC4s/ciXhVLp7KvUow3GgzoyYBKn+CYRLXM3gDE/5R3S6Acj8veXi
	 p4Uz1O33fJv0rWaWG0Q+iTUzPRon67kaS3pDdy/2GpyQASS6EkD1xGnvg9/mq8r2uc
	 KsnmbBZPY707A==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70842dc27easo6559827b3.1
        for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 07:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV42v+qpsJO0TZmJZdLU1QaY4Y6UzgBWu1C+UwiAPuxzY84cFacOwwfJD5857v6qeU5D1erAYZ7eYYJTtdo4w==@kernel.org
X-Gm-Message-State: AOJu0YxZWgkEfyHKzWsNNsZ+x8vPjfUkdRwoW1AWqXbDQ+KoOFz8+FOR
	bPTXrBStgIychqsK0+sk+W7hY/DmZ9s1z+4CDtAbekpZ7RvCW6eZNp/itUHWgxJV8dwuhcX3cej
	l4gq/ZdHTdeJjyCprjwGwiXioJss=
X-Google-Smtp-Source: AGHT+IESf73F8DZRhUvtfEAszA0wtCzkNN025Wt8+jB2rviQ/Im211Gg+YfrM+nIXLKxdTRNA49aoRpA0kSxZm3fODQ=
X-Received: by 2002:a05:690c:9b10:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-7083ec3fb03mr39632977b3.17.1745504902068; Thu, 24 Apr 2025
 07:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
 <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
 <222a5475-c63e-44de-f9da-4a993a70623b@quicinc.com> <6xt3dmrd6z26na7e5kqro5ws3ulbm4wop2k7wl5wt3m2fr4rql@barhdtegzw5s>
 <5e296369-0960-680a-ca35-916e3b733d4d@quicinc.com> <w7lrgbrnx6kwoel3rzwsz2sa6g6f2t6so2bm5t3fqcpxlbwp65@fxbwih4jpsc4>
In-Reply-To: <w7lrgbrnx6kwoel3rzwsz2sa6g6f2t6so2bm5t3fqcpxlbwp65@fxbwih4jpsc4>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 24 Apr 2025 10:28:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4hw2ZxEhR6XWaBV4n+V=V3Ecz6BX8px1AhZOJ+-zTEbw@mail.gmail.com>
X-Gm-Features: ATxdqUEimUq7Yv_jOuzq0bUzA09hRaD1143PU0S0ZcarVthBokyXir3qPkuzQvI
Message-ID: <CA+5PVA4hw2ZxEhR6XWaBV4n+V=V3Ecz6BX8px1AhZOJ+-zTEbw@mail.gmail.com>
Subject: Re: update video firmware binary for SA8775p
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Apr 24, 2025 at 05:30:37PM +0530, Vikash Garodia wrote:
> >
> > On 4/24/2025 4:48 PM, Dmitry Baryshkov wrote:
> > > On Thu, Apr 24, 2025 at 04:25:06PM +0530, Vikash Garodia wrote:
> > >>
> > >> On 4/24/2025 4:13 PM, Dmitry Baryshkov wrote:
> > >>> On Thu, Apr 24, 2025 at 03:48:24PM +0530, Dikshita Agarwal wrote:
> > >>>> Hi,
> > >>>>
> > >>>> The following changes since commit c67433231cbd8bcf90b5563bed22fc7=
a62bbc2bc:
> > >>>>
> > >>>>   Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:=
24:26 +0000)
> > >>>>
> > >>>> are available in the Git repository at:
> > >>>>
> > >>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > >>>> video-fw-SA8775p-16MB
> > >>>>
> > >>>> for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991=
d1ef1:
> > >>>>
> > >>>>   qcom: vpu: update video firmware binary for SA8775p (2025-04-24 =
15:07:18
> > >>>> +0530)
> > >>>>
> > >>>> ----------------------------------------------------------------
> > >>>> Dikshita Agarwal (1):
> > >>>>       qcom: vpu: update video firmware binary for SA8775p
> > >>>>
> > >>>> WHENCE                        |   4 ++++
> > >>>> qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
> > >>>> 2 files changed, 4 insertions(+)
> > >>>> create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn
> > >>>
> > >>> How this is going to be used / selected?
> > >> Once the board memory map is updated to have video PIL region as 16M=
B, video
> > >> driver would switch the firmware for that board to vpu30_p4_s6_16mb.=
mbn.
> > >
> > > So, by changing the DT to point either to the old one or to the new
> > > file?
> > Thats right
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/527

josh
