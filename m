Return-Path: <SRS0=qOOa=EE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F3CD8C8E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jun 2026 05:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B45C1F00893; Mon,  8 Jun 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780897342;
	b=VkAKZcXyEh/s4cl+XruLDKNml97U2Ef56WPGYBXE494y4+N9evbQeUV3qYx743Bg7x+L
	 Vva2NeLEkXcVqQQXG/fNLmIyzX4kXioPkaXy12qkckcHv74qKQ0oa6Dm/aHq9fDS7O2Mv
	 ixodknYhPZsC0FzYWz0sYsOu4AZ90Z29/jH7MKAuLkGJ0lLH3H74sLgzxojA3bUat27D5
	 Rur4gp08aEldr6harmBu23ynjAXiJvrKLIzHbvUT7LLhd0jEpUuIa3VyfCj2z+RzOCTY6
	 E2MhczPST2MQIeaCBmxOdkWyJ4yVEIqoRuX/uk1sDX1efCk4uswPehH8WGhWwLwUhwA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780897342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ntnVxYs0h4z1K60wUIDb1IAzFM8VrsaJoB7BrLrCXM=;
	b=Q5p5UHsWK4ioGYGKImV2ZxnS96FTCFh/apnSC4tPtzClrxKspeqtfAsVeffpMY9pisy3
	 kfgTwhmqaVOL1awcDnQXMNIdw66isH5jdKTLt8YKcJOxdynZs9AUJSimruGDc1VlGOIZr
	 evNRfp15+5azveUETY/EQh/2nNIcDQzxaunU0WkDDxC28YCPa0/vc6C+GCxbEsqqAnOBs
	 7bOfbx/jahjnUa7PnXZeLbKFlx1vk19zI1k+FVNXGD1lTmA+1iX4KiCiyDaj1thv7DCkL
	 OcALwnI9Ce6hEL92FdzW8DAyfkIHY8QnrRY6kKkFCVGA5R7CTyQhz+6skvg3Ov9fXng==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yqhPJQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAiuwFbf;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5C6C1F00898
	for <linux-firmware@kernel.org>; Mon,  8 Jun 2026 05:42:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yqhPJQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAiuwFbf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D5C6C1F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GbsR1991577
	for <linux-firmware@kernel.org>; Mon, 8 Jun 2026 05:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7ntnVxYs0h4z1K60wUIDb1IA
	zFM8VrsaJoB7BrLrCXM=; b=e9yqhPJQmUB88vTPIJs/nRHrALaIZZR/37Pqepbp
	kj2Pt71tCeGpzaZfLL3QLk/i8KZQqsrxXapTOchj0ZRpwgZDmN+ibEA0wV23eDZo
	CpSGxsuQZujMEh8Qe3VcwQJ9ySmUXsV5aCUw+r6Rf/omYR/tkH//LK3d30PnWT1m
	6N+W6BmMoboMnCrXNftZJdHJv/hzmXSfj8Dte0JcUkS8mIW31as6N7o2/N7JvKCz
	dgDkWxkKfj9aHMPZhGZWO8uPGnrrG5OzvjAZhS6tBwgKsGnzXuyXHq3s580+UYgw
	UPtCEckFejNqUVYUT4zt6Tmiz6Awx/eMaz8dKlZr9PLRlw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3pdme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 08 Jun 2026 05:42:20 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7efb00802b9so12042407b3.3
        for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 22:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780897340; cv=none;
        d=google.com; s=arc-20240605;
        b=MbJFTko7N1eG3ujOXnmn4hRkeGATpmm/A5f4YgZ0NWUpumTHxFItD3m5WrcIhwzsG0
         C8gLT/jxZ1xHai67iMUl/8upxYUgwIX3+e8qSy+s2MTDwXqKjRA4qAhgojISNmX00J7P
         sGd+8x5ITbt7FTwIKD0HP3j5WG9oPva56zVKMtWeHCMwQRBisKlPWpKV05csHktBFTWA
         hhhPv1oe+0pRXIH5J0aJkbzjrh4az0AE+zfGsbPxdjKZJAWvf30tRJCljbR2UMQm+1Ow
         mk23q1lzc7pUEsBmgXl+h9tfB9juWcT4zgU0vAqCDdmTFNTmEUY3sZh+K0hhx0t1lte2
         82xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ntnVxYs0h4z1K60wUIDb1IAzFM8VrsaJoB7BrLrCXM=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=OfgphiA9bN9Zm3zvSZA5LTeRY0jRoTyBmy+r4qenTgMctk6DMyoxqe/8jxD9SRxrZt
         2dv84unJ6lVRuwywotzQwZqnCSjpXNSI/fin/teVeuDuQGa7FgC7u5GqX6XwxMd0m5MY
         zQyp8BfCjD6oWlZ99Yb3f0Rr6VAwYl0EstEjR5wkoAzK5qSEihtyCedAaDCVam95MPir
         qgFyY81bj3KioZ8epf6FXQTYk7/dceNO2he4KykVxFONWTxvomG4dGV9D+Vadu/7tK1K
         ueEMPTRAN3jZcg+2ABZXVD0d9sWJWetvSYRMYiQrcNNJsoQi/PcOMR6jlLsGJLu3iZej
         hFBw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897340; x=1781502140; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ntnVxYs0h4z1K60wUIDb1IAzFM8VrsaJoB7BrLrCXM=;
        b=PAiuwFbfF1TMMKLboY4I1D8CL8ro+Wieg0xu4Gv+r3cFhFe55nD9qLbxtclOP0MP1O
         gTkCNBNiC0dP7i7aoO3ar40FjKrtQNvdSsiWPZzMvOuRLUJdKb/ZwYrgbV+VUCrRRdNK
         URW9MR04sxuXJvx2n3+c1VMWO9orO5rioxop1tlkP1VZNoLP2Uy8sY23TIsu6nlYpM8X
         CuOjgo1i2aUcFOaledXCseaeCVkxBAc5j4u4e9PPn/NDKJPRtz22lvDHDl+/9M+esU0D
         8vO9XAsCP029E2ClCY+QceFazKe1NfbGhRa8ESh/ioYbLR82lkC6OpipOw72Y/vP37Lz
         np+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897340; x=1781502140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ntnVxYs0h4z1K60wUIDb1IAzFM8VrsaJoB7BrLrCXM=;
        b=ndG+UbtXTOsR+/f/PR9Hmebt4X3/Ct/6g2JX35+WP6+Tamp6IodAjFgMB56AGGVqIg
         seVqQJ+hjVTrc9VRPLviqVPxf0VjY9C5HyRTM+CtH8eI0fY3qdRz2wVzAOTP4qYM6OeJ
         LjJYS2/lDuJ53veFQuKU/bLKqovX8B4JAqpf0X4FN7l8bpmoBQ7tyxx4y/mNnSmm5h8j
         +DRA2TBUpA5sel7lDEq2q35BgBPdcgEGtV98lQmst39KcC7pl2aJjDFmm7pU+/ainuOX
         FmlTDLZar+FfDjU7e6jetlKkrx5dDGBjIGPZqdSH90d9C8DczjUryOyMQmEzUgVwwVK8
         rGbg==
X-Gm-Message-State: AOJu0YyyvVI/Wdg962d4Z6iv+OLeuzIeNNfon+GpqI1N0ssLvzE23nQ9
	AEIBlfGYcq4Sxz/wZmicFd4zZfqGjq9pyyepeNAYod7kN9DY1jNk4jwB/rMf7ls+zoZcW0MeGYB
	t/F3gstM2Yh2QEyS6RH+dNKPrN6YJjqa3bvcJGrnoCyBB0l5frzJULGz0fGufeAoAIZxSBkmhtv
	GcqjUKfzK492ubUaUhZ/UMq1bFJEPZ0z1dzC9BPMZX7FiQNrZZ
X-Gm-Gg: Acq92OHdMvAwuqycTZYI7S998McYAZQnvxY+EuM5f3uSwzmdiOGc8cm9WyDBiq1yMJF
	DnELgxQ2njxhqJPo2twcWENbpq6rvH/VhQfQTLHLWCOmb3sYxwM4QaGDjr7PFF6nsrTUE7dn2kF
	inkbx+BgGCrkvNgSahZb1lN7Q2TL7uudqb0/RzuGF334vLhYoghmerj3tSTw/1gYSx2411SwoT4
	gIM29BxerrveKnTnKodtJtvO7ThYcCpW13k6SJBwxA1GXd6vz0=
X-Received: by 2002:a05:690e:400c:b0:651:9286:57a0 with SMTP id 956f58d0204a3-6610692f629mr10024835d50.0.1780897340470;
        Sun, 07 Jun 2026 22:42:20 -0700 (PDT)
X-Received: by 2002:a05:690e:400c:b0:651:9286:57a0 with SMTP id
 956f58d0204a3-6610692f629mr10024826d50.0.1780897340108; Sun, 07 Jun 2026
 22:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <a8c67889-2c23-45fd-81a4-e5a6c776771b@oss.qualcomm.com>
In-Reply-To: <a8c67889-2c23-45fd-81a4-e5a6c776771b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 08:42:08 +0300
X-Gm-Features: AVVi8CeqV-myIkPYGj2uDTiO_S2l7kg2mPLeCw83iCfBlordQtRxKhRP1LTW3U0
Message-ID: <CAO9ioeX1EHBOfUVjpXtYxzzYPUcMfj9Y2v+uu6DfY_t-Bu7SAQ@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX7/hh3gmC9tWY
 e3vfjGh4UGkrizyBmKt9+jPmbfXUpHRgzjTaC2jUgaEXCAswS4oEYuxL4xm8XYdX9CUoXbop9Ue
 meWLA8CGPu1blFwtzDf+fIs8ZRs+ZIo8839oJqcl498a96akKj2XzBhYPgmhhPpLNLU7o4CMacI
 E0lqlbiVYwpITlCFySuweY/IGjII0midBCXypma2Ps018jtAwYh8vsTEhF2CVOXUH7gVSizdU5V
 mSJ+QkiY7/4eDmViRNSZyeEc7sOQg09guulqFOdQA1Hfk05/SnYgOraIi4G6+RkkZjmq76+WJuz
 bu1t2IFD16MCmk9jredJNTyw1SitziUK0iGykhO16wQg5wXDq1BTeD8dop+MU2SzorY+ZQq8xkR
 GBowEHk9pmAGUWg9K2UJ0Oi9r9LlukLLitEJmcjdSMB+tLYQ1hcj3ONQ5/KPS8jbBNs410CnVXZ
 WXYbaBfpz7foBJrYWag==
X-Proofpoint-ORIG-GUID: qIaiIoutNMXng-fyZ_tILQoWZ8e8rY9e
X-Proofpoint-GUID: qIaiIoutNMXng-fyZ_tILQoWZ8e8rY9e
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26563c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=dDxfOmnVuKJZJNdA5P4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049

On Mon, 8 Jun 2026 at 06:58, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:
>
>    Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-monaco
>
> for you to fetch changes up to 331ec9dad02591b7a9d9cf059b1f2573dd117f65:
>
>    qcom: Update DSP firmware for qcs8300 platform (2026-06-08 09:25:04
> +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1084

>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Update DSP firmware for qcs8300 platform
>
>   WHENCE                  |   6 +++---
>   qcom/qcs8300/adsp.mbn   | Bin 6799360 -> 6803456 bytes
>   qcom/qcs8300/cdsp0.mbn  | Bin 3174400 -> 3178496 bytes
>   qcom/qcs8300/gpdsp0.mbn | Bin 5992448 -> 5996544 bytes
>   4 files changed, 3 insertions(+), 3 deletions(-)



-- 
With best wishes
Dmitry
