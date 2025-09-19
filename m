Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B07CAC59A
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 14:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D264C4CEF9; Fri, 19 Sep 2025 14:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E71C4CEFC
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758292320;
	bh=ezfOU/1GMLWeqS+bjgy1ZwWTdgQNEIEBXo9J8JeXB8E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PWbawacudtOvyg3vVGMGGiOmwoIFBIWIpS9HPm2TganW/fRXX3vsJHZeKnS3jXOom
	 gDL7CLSKgSsw3JQo0g/8COHi6z+zdCIJk2uw+N4Nfzg/OunR+SOncvYiqLfqqdYh3y
	 ttqgmqxCm1waPpj3R3bwIrRP4fqjW/BcLgeScPBAQDohAOenjnzccsjU3OgEuiPCd7
	 J4alQTbXJ4fzC1B7vJh0MZUdfstGZnJb58f6EeOP7V95ncI20Y6CIy9YOowCB4cAH9
	 XS9VrF7uOLYRujPTj3cHxUFtvFjGAFHTgTuy9sxhYs5Oobg5tmj17uAlZr5wZnCRbC
	 XJrUZ18mNBkRg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d6014810fso17135857b3.0
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 07:31:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YzGwNTsjGVVkhJQcppcQjK7n6UHEQfOSB5X3RYmXmkT2HhLbk52
	hrXnfEj4EtJMhbdINw+DPP2x3KVkqKZm0C9zAU5Yawe2/AEpPugRJoz8ljo+7N6QBVjITS8c5SH
	tCqUtKU9zAeXwt1CAASy1xbbyrbxYQsA=
X-Google-Smtp-Source: AGHT+IFCQN6I/KYO7xVrBSNFPDc5Kyac3QZX8xN90CS+V124H8ksRuV/W1kaFUkMgoZAWdeH1sqzdd0wvkGzwsWpr9w=
X-Received: by 2002:a05:690c:5092:b0:734:81db:1b33 with SMTP id
 00721157ae682-73d3237e749mr28124147b3.19.1758292319285; Fri, 19 Sep 2025
 07:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <9cadcd6a-5f99-4a2f-8aac-c612f355d82a@oss.qualcomm.com>
In-Reply-To: <9cadcd6a-5f99-4a2f-8aac-c612f355d82a@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 19 Sep 2025 10:31:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA446=RjjQpbAeiZYVeX-PAx1MrPVU_yPnOtOyuoJjLxDQ@mail.gmail.com>
X-Gm-Features: AS18NWB_2BdrTn8cn6c5KQ00nGtZALj68uPuOx4rGtGAkFYLcFDgRu_jI6sPALQ
Message-ID: <CA+5PVA446=RjjQpbAeiZYVeX-PAx1MrPVU_yPnOtOyuoJjLxDQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath12k firmware ath-20250918
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:17=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit 37f3f2d8e14cff7b316616924331d57f6ec6e2=
59:
>
>   Merge branch 'robot/patch-0-1758163077' into 'main' (2025-09-18 12:26:2=
2 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250918

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/696

josh

>
> for you to fetch changes up to 1d588f106ceea113c4c650b43d948da5746e704c:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2025-09-18 11:03:58 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 2253732 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
