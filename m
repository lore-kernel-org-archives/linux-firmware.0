Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284B5C5321E
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Aug 2024 11:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9802C4AF54; Mon, 26 Aug 2024 11:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED0CC4AF1D
	for <linux-firmware@kernel.org>; Mon, 26 Aug 2024 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724672170;
	bh=M7ZVeTt31TPfn2NErj3fDSYNlMiUS0z1Vu0MbXHiCKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pTn9Y6b6l3UpurD57lkbr9W4WUOgbgA3cOJnQwxzSjVJpuP+0aZSG+wfeHHD4E5TR
	 iqvqh+MIAQkuYxoRJwh+3WjFOuUE0c8PkF2BuD8N2z0CRsfwA4Pj+9fABL0N8GLCIb
	 PlrahQ/gq3Z3hm12TN9id+GNrtw0a0pUrKxJbYar8aP21Mqasd4cujFVzbGxMSAU9u
	 nuFbJ51IHt7BZ5s2iLF1ix3pv0S2rWADEdWq12LE7+hdj193//4zwd6NRbbIzwqQUM
	 vayxcPo1M+CcXRw4JQeZahN3+mKuq5+yfjrijG4vbmwXiZJBCzYWQLF0VTgxbozoje
	 yOR6r4RA+5KMA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6c91f9fb0acso15020117b3.2
        for <linux-firmware@kernel.org>; Mon, 26 Aug 2024 04:36:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YyX/M8s69wa1otdPuuwuXF3U5n18tXnaX2NexUUAmVwFuini7N7
	RvPWJViIgyVpRNH/M6A6r+z9PyEr7y4r/UqYIH9UQVAvYIH58lW1+rS31vh+NxBcb3ATRGx8gT1
	zPe8QLtb0IeMOC9Uag0Y6n8HuOwo=
X-Google-Smtp-Source: AGHT+IHNMXnVy2xDsaV6fk55VXC+drYHKaO2gGo1S+tjUmZLFFbZ+OMylNWnPlYG7pyvPuU/XAN12WXsHsSvPpS+4hI=
X-Received: by 2002:a05:690c:87:b0:64a:7d9b:934 with SMTP id
 00721157ae682-6c62576b18dmr99768727b3.16.1724672170033; Mon, 26 Aug 2024
 04:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <f5079de6ec52bbd97fd0deaf2df58f8b13e364b7.camel@realtek.com>
In-Reply-To: <f5079de6ec52bbd97fd0deaf2df58f8b13e364b7.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 26 Aug 2024 07:35:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7xrSXQb2pRntPbHY3+gL4rEHCHf0jeBDwkiiv542BuRg@mail.gmail.com>
Message-ID: <CA+5PVA7xrSXQb2pRntPbHY3+gL4rEHCHf0jeBDwkiiv542BuRg@mail.gmail.com>
Subject: Re: pull request: rtw89: 8922a: add fw format-1 v0.35.41.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 5:32=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Add firmware v0.35.41.0 of rtw89 driver for 8922A.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 2cdc11a7b3bf06042f1fb179fa1775fde38149=
1f:
>
>   Merge branch 'mt7925' into 'main' (2024-08-23 11:31:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2024-08-26

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/282


josh

>
> for you to fetch changes up to 80fa33b94a91a1e45671e8fcd8e80b9efed47834:
>
>   rtw89: 8922a: add fw format-1 v0.35.41.0 (2024-08-26 17:08:00 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8922a: add fw format-1 v0.35.41.0
>
>  WHENCE                  |   1 +
>  rtw89/rtw8922a_fw-1.bin | Bin 0 -> 1583434 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 rtw89/rtw8922a_fw-1.bin
>
