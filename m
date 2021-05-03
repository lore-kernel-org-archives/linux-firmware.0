Return-Path: <SRS0=SFki=J6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B0DC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 May 2021 23:30:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D21961090
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 May 2021 23:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D21961090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VloleWM5jtvdsmA+0uhDKLN20BL95lpr5gduY6w89C4=; b=NxxE+7CM+cVmvd/x9NpM/sSoH
	QWYp2iL/EmKJJsvCCpPF9zrz+6uxcPShwEYycpWas5F+s7BVovj3z03lRmkHdrtx6d2XNwFGWbxzm
	ayW++cA5grlBfyMwk/vC0OR4raB0QRYm35DFPmSRKGPfueKWpU/1/W9LhT7WPGo8ijKhGuRb6IAUG
	MzEyIWrJsIo/x7ykDhvzwNW2AEZTNy9jfwhFsk/GPgQZL3k4L+FotWIiwE68Z87CVBAGz+ZdH478y
	XbkU6/hr0s+IbXj2vcVj6+mOoWeGugL1QdkJJ3U0s2hm+iON+3Re9R48XxkYasjLbcNgi7a+R9WWh
	yxpx2MyOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldhzZ-00F1rC-7b; Mon, 03 May 2021 23:28:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldhzU-00F1qw-Jn
 for linux-arm-kernel@desiato.infradead.org; Mon, 03 May 2021 23:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8tDRQLTzxgkQ8nBtzM8IyrwAisziDDGhHGkrB3Sahww=; b=KMKv1sJYPVPGHoc919mW9afiK6
 tw8h4g0Sn68HckljFfAn3Ou7lpW1L2P1Hzy6z0IiWzRf5giA4S5B84kRctZlA6T8/GYVAt15zba5/
 dOAwjEA70vhW3ofbTSzA4rrmSYH+Eh/YvKvQMtDKoyHnfSeSy3cd7d8clB0fCIuKEqedN7DrlI6ud
 F5q/9xtG/TgvKrjmtojF8kruvM9d2mvyM5rShg77Tyi9q9TtzI3Mm94Q42VC7Acj0O9Ezf7fUWXT9
 QXXglmU3ql9txdZyev9o9oBqOgfbniXaOXvb85BaXkTJtgFIl80xvc+VJbZej3ppjqfg8s5dOuLK9
 ivjVtIbA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldhzN-003YFW-Jn
 for linux-arm-kernel@lists.infradead.org; Mon, 03 May 2021 23:28:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D774610A2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  3 May 2021 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620084513;
 bh=+YOAqB1pjejRQzGohauJHM4nBNSI+oGtI6JOsYPNNCM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=OR2B+uq7GRXOeuvZtoviKbmDvlVjlurK4eQeYW/MO9KR8YWNYTHcw32WP6j5z1KEZ
 sxVZt9vlmLauDbwRN7Tn0vuLq4lRvpVlLIK+WKTyN6rLlJ110pneomkyUE0TsM/Dov
 66toYJim+5/vizWZJxnyXUci65R7HGqJ89T0R532N80yg66RDjUJvOFu4iUaz+c4y7
 cxIWVbDkOlDC1ooVKoWYtNh8rhPkl6BXZT/3ZHpGLiSlBtivayMk+F2eyFc4GTl3gI
 LvRzJnrQntfbEFP7sS5Z+77eQD6vjlQK27gqdV61wTNM1fZ4gcgGeD91W01YulaQUf
 kpaul4Y0YcMww==
Received: by mail-io1-f52.google.com with SMTP id v123so5508999ioe.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 03 May 2021 16:28:33 -0700 (PDT)
X-Gm-Message-State: AOAM530IXby0GMcTNPLlWpIfb/S8UmpmZwwKapNQZkkyzMnei8Q/1r+S
 47HvID1sieLsRr4ZI7MNdDEr/PZ8HzUkPxx4XKw=
X-Google-Smtp-Source: ABdhPJzhoEvVfkypjDZ6fPIQaOwTX7955CBmeyxqihMmP9U8Y+h4BDpIJyw8yPGVO6gH0+KXOwE4XX30LqNJNN6pF7Y=
X-Received: by 2002:a02:6c01:: with SMTP id w1mr20934503jab.107.1620084512603; 
 Mon, 03 May 2021 16:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
 <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
 <c38ab84b90feddb43b2782fa11ee5189@codeaurora.org>
 <52ac8a546ecdb6a11b10edf936ba714d@codeaurora.org>
 <194da82a3a5f2010fadca4fe6960b359@codeaurora.org>
 <f2d3176d5e78b50275ad81d37e908d4b@codeaurora.org>
 <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
 <87a5e5795d06cd8a87315b74b201d693@codeaurora.org>
In-Reply-To: <87a5e5795d06cd8a87315b74b201d693@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 19:28:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA57BW4=PWV4oqiazH3-iCp-KLYthFUQajucyxdC5fEx2Q@mail.gmail.com>
Message-ID: <CA+5PVA57BW4=PWV4oqiazH3-iCp-KLYthFUQajucyxdC5fEx2Q@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
To: vgarodia@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: smagar@codeaurora.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Linux Firmware <linux-firmware@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, 
 linux-media-owner@vger.kernel.org, dikshita@codeaurora.org, 
 adhudase@codeaurora.org, sampnimm@codeaurora.org, mansur@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_162833_726444_079F55EE 
X-CRM114-Status: GOOD (  24.62  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210503232821.TsY7FYLIOSuit3ajw9vWH_ts1C2x_rc2fKvCemPkmLU@z>

On Mon, May 3, 2021 at 1:23 PM <vgarodia@codeaurora.org> wrote:
>
> Thanks Suraj.
>
> Hi Josh,
>
> On 2021-05-03 19:05, Josh Boyer wrote:
> > On Mon, May 3, 2021 at 3:30 AM <smagar@codeaurora.org> wrote:
> >> Hi Vikash,
> >>
> >> As you suggested I did this changes.
> >> Below is combined pull request for venus-5.4 and VPU-2.0.
> >> Please find snapshot of pull request, let me know if anything is
> >> missing.
> >>
> >>
> >>
> >> The following changes since commit
> >> 85286184d9df1b03bb76049edcfd87c39ce46e94:
> >>
> >>    Merge branch 'for-upstream' of
> >> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> >> 11:34:11 -0400)
> >>
> >> are available in the git repository at:
> >>
> >>    https://github.com/suraj714/linux-firmware-venus.git master
> >>
> >> for you to fetch changes up to
> >> c7b11ed12b6391097e84babab62802076fd15902:
> >>
> >>    qcom: Add venus firmware files for VPU-2.0 (2021-05-03 12:18:45
> >> +0530)
> >>
> >> ----------------------------------------------------------------
> >> smagar (2):
> >>        qcom: update venus firmware files for v5.4
> >>        qcom: Add venus firmware files for VPU-2.0
> >
> > Vikash, does this one look good to you?
>
> Yes, the pull request looks good to go.

Pulled and pushed out.

josh

> >>   WHENCE                   |  19 ++++++++++++++++++-
> >>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> >>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> >>   qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
> >>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
> >>   qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
> >>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> >>   qcom/vpu-2.0/venus.b00   | Bin 0 -> 692 bytes
> >>   qcom/vpu-2.0/venus.b01   | Bin 0 -> 7376 bytes
> >>   qcom/vpu-2.0/venus.b02   | Bin 0 -> 300 bytes
> >>   qcom/vpu-2.0/venus.b03   | Bin 0 -> 20 bytes
> >>   qcom/vpu-2.0/venus.b04   | Bin 0 -> 20 bytes
> >>   qcom/vpu-2.0/venus.b05   | Bin 0 -> 20 bytes
> >>   qcom/vpu-2.0/venus.b06   | Bin 0 -> 20 bytes
> >>   qcom/vpu-2.0/venus.b07   | Bin 0 -> 24 bytes
> >>   qcom/vpu-2.0/venus.b08   | Bin 0 -> 16 bytes
> >>   qcom/vpu-2.0/venus.b09   | Bin 0 -> 939184 bytes
> >>   qcom/vpu-2.0/venus.b10   | Bin 0 -> 42976 bytes
> >>   qcom/vpu-2.0/venus.b19   |   1 +
> >>   qcom/vpu-2.0/venus.mbn   | Bin 0 -> 2031188 bytes
> >>   qcom/vpu-2.0/venus.mdt   | Bin 0 -> 8068 bytes
> >>   21 files changed, 19 insertions(+), 1 deletion(-)
> >>   create mode 100644 qcom/vpu-2.0/venus.b00
> >>   create mode 100644 qcom/vpu-2.0/venus.b01
> >>   create mode 100644 qcom/vpu-2.0/venus.b02
> >>   create mode 100644 qcom/vpu-2.0/venus.b03
> >>   create mode 100644 qcom/vpu-2.0/venus.b04
> >>   create mode 100644 qcom/vpu-2.0/venus.b05
> >>   create mode 100644 qcom/vpu-2.0/venus.b06
> >>   create mode 100644 qcom/vpu-2.0/venus.b07
> >>   create mode 100644 qcom/vpu-2.0/venus.b08
> >>   create mode 100644 qcom/vpu-2.0/venus.b09
> >>   create mode 100644 qcom/vpu-2.0/venus.b10
> >>   create mode 100644 qcom/vpu-2.0/venus.b19
> >>   create mode 100644 qcom/vpu-2.0/venus.mbn
> >>   create mode 100644 qcom/vpu-2.0/venus.mdt
>
> Regards,
> Vikash

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
