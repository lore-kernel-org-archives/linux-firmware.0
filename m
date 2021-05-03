Return-Path: <SRS0=SFki=J6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF4FC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 May 2021 13:37:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EC361208
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 May 2021 13:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EC361208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qFXOeFiSD8ruHjd9YydEW778vzDxFNUJPPcVgS0Mgw8=; b=HVYIgJW4R4TMIiS/NE1A+v0ro
	EHkhu91Q8DsqvRodpx06+7ZYh8DX7kjPEolt4mvWzhouHoDr5ALdj4wBEIJHV0Y3GS2mzXuWzetM2
	UlJUHtSQUTNwhp5ym2rH9wOU/9BgRGUKK5/6J+/PsTaEk7Hn/3SpUQeRMmwmtVWz1aq3N0DYIzn8+
	87kz7fsL45clr22AYpu8I9CXMq9GPkgoe2Fe8IG/LVIkfO5vwCsf2C7WZWj+NqKQbN8eagPXdYC4c
	bAsoYurwV6O4j3/z/yfJBb20tjB+IgiXcxopG9NMsn4ho5SeGydOIyIoIdSYtqRw7729a5f3FWdkz
	lwRfJfUbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldYjN-00DxEh-Ny; Mon, 03 May 2021 13:35:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldYjI-00DxEC-Cn
 for linux-arm-kernel@desiato.infradead.org; Mon, 03 May 2021 13:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0RkENV7nYOwpg/qy3hc5h0DM0V/xvlIbkaoVTQFW/Xg=; b=eGyMXUgxy6e2QwmGNwnCQUwlpn
 Pk5uCuxt5STPczgvuRJ0SYQYlderTs3oIRWVB7NdcYWEM6m1RcUzl+VJR9hw0BF4tS/cb4kOI5dj/
 Ksw9MdYUuLsNywNWq9VdQflNu+d3LEIPLmDyT0dyR0EPLbfCBEJmSkzmuEtZ8atluSaUaPRN1HBQu
 4MXUrGxBARPXffDj66QQD7eGaBSWz9Pi9PvycykYIMBi82u3EFuLUGZ4ChwHvOgqH+wFQ53tM57WY
 plE3byEHQ1MuSSdQxGrUzRJwX94f3/UL8vyHQKbLXG5cJNz/zwQupbtNPucWb/ZK6Ubw4sGcChxLG
 ZqGYfYDA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldYjF-00366q-LB
 for linux-arm-kernel@lists.infradead.org; Mon, 03 May 2021 13:35:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9F106135F
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  3 May 2021 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620048916;
 bh=cePqa/WFr9HsXd1s/HO7Jgh8H844BeoQmX9ascnZcWs=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=uWed32ZkYf+G4fLVzOQdNncyxN4GNhzLcE6FoNKDBIJisYtXff99Vt7fvvScpiqDj
 Ii5rn8+3iJT70up5h7ollXli0JVJ6+aoXeYGao2glMT7kFKO0cr5CPTszVDpHtB+K3
 +v0Ry9E443mGZ2cFOCV2wNLd5wdtwwVEikKz/C+yQlpJ7Oj3wsh8fainIJC/o9NE8A
 bIFW9WIDgiAB2OCk/ZRoTtQlGyp7c8PJLiV6+Xla7T028cCx0IuPvw9NaGhcgo4Pp4
 oP/SsDrKWVAnnW381Q8aLK7biu2FTSo1b92PgQO286FhpUZ8hqIvlk+A5udVOIaJwW
 uNtH8KZsnTUfw==
Received: by mail-il1-f176.google.com with SMTP id b17so3678271ilh.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 03 May 2021 06:35:16 -0700 (PDT)
X-Gm-Message-State: AOAM531hmacPK9WUvhpoaN8Kv9FDV1U6ABCCrdoESrfmjhbGtvc7Ksf3
 ZiKwPkUQRvYmPUoLk39j9SHaQsX+4JyfgHO8YIs=
X-Google-Smtp-Source: ABdhPJzThCRs0ZJm1R3XcF6UouAzeNP/MZm8lDhi8z2vs9FEBdCI5ydFWtCjT61palnbDnxeU7XMR2fuNd+UFnDY82E=
X-Received: by 2002:a92:dc90:: with SMTP id c16mr10759330iln.11.1620048916191; 
 Mon, 03 May 2021 06:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
 <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
 <c38ab84b90feddb43b2782fa11ee5189@codeaurora.org>
 <52ac8a546ecdb6a11b10edf936ba714d@codeaurora.org>
 <194da82a3a5f2010fadca4fe6960b359@codeaurora.org>
 <f2d3176d5e78b50275ad81d37e908d4b@codeaurora.org>
In-Reply-To: <f2d3176d5e78b50275ad81d37e908d4b@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:35:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
Message-ID: <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: vgarodia@codeaurora.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Linux Firmware <linux-firmware@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, 
 linux-media-owner@vger.kernel.org, dikshita@codeaurora.org, 
 adhudase@codeaurora.org, sampnimm@codeaurora.org, mansur@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_063517_795446_16542ED6 
X-CRM114-Status: GOOD (  21.77  )
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
Message-ID: <20210503133505.JdJTGsvjYHibTnxPhRpJaiIk7LO-zEXzipgU_UyXUqU@z>

On Mon, May 3, 2021 at 3:30 AM <smagar@codeaurora.org> wrote:
> Hi Vikash,
>
> As you suggested I did this changes.
> Below is combined pull request for venus-5.4 and VPU-2.0.
> Please find snapshot of pull request, let me know if anything is
> missing.
>
>
>
> The following changes since commit
> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>
>    Merge branch 'for-upstream' of
> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> 11:34:11 -0400)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-venus.git master
>
> for you to fetch changes up to c7b11ed12b6391097e84babab62802076fd15902:
>
>    qcom: Add venus firmware files for VPU-2.0 (2021-05-03 12:18:45 +0530)
>
> ----------------------------------------------------------------
> smagar (2):
>        qcom: update venus firmware files for v5.4
>        qcom: Add venus firmware files for VPU-2.0

Vikash, does this one look good to you?

josh

>
>   WHENCE                   |  19 ++++++++++++++++++-
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>   qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>   qcom/vpu-2.0/venus.b00   | Bin 0 -> 692 bytes
>   qcom/vpu-2.0/venus.b01   | Bin 0 -> 7376 bytes
>   qcom/vpu-2.0/venus.b02   | Bin 0 -> 300 bytes
>   qcom/vpu-2.0/venus.b03   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b04   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b05   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b06   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b07   | Bin 0 -> 24 bytes
>   qcom/vpu-2.0/venus.b08   | Bin 0 -> 16 bytes
>   qcom/vpu-2.0/venus.b09   | Bin 0 -> 939184 bytes
>   qcom/vpu-2.0/venus.b10   | Bin 0 -> 42976 bytes
>   qcom/vpu-2.0/venus.b19   |   1 +
>   qcom/vpu-2.0/venus.mbn   | Bin 0 -> 2031188 bytes
>   qcom/vpu-2.0/venus.mdt   | Bin 0 -> 8068 bytes
>   21 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 qcom/vpu-2.0/venus.b00
>   create mode 100644 qcom/vpu-2.0/venus.b01
>   create mode 100644 qcom/vpu-2.0/venus.b02
>   create mode 100644 qcom/vpu-2.0/venus.b03
>   create mode 100644 qcom/vpu-2.0/venus.b04
>   create mode 100644 qcom/vpu-2.0/venus.b05
>   create mode 100644 qcom/vpu-2.0/venus.b06
>   create mode 100644 qcom/vpu-2.0/venus.b07
>   create mode 100644 qcom/vpu-2.0/venus.b08
>   create mode 100644 qcom/vpu-2.0/venus.b09
>   create mode 100644 qcom/vpu-2.0/venus.b10
>   create mode 100644 qcom/vpu-2.0/venus.b19
>   create mode 100644 qcom/vpu-2.0/venus.mbn
>   create mode 100644 qcom/vpu-2.0/venus.mdt
>
>
>
> Thanks,
> Suraj
>
>
>
>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
