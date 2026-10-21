Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131A606A319
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqrRV/Dd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xd4QSP/P
Received: by smtp.kernel.org (Postfix)
	id 164901F000C5; Wed, 21 Oct 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792587820;
	b=G00E+KfCTJRdmsAc/8i2lkB0b/aCB5njy4Qp+D7z42JQXzuaonJVvyXYs0Tohkq4QDwN
	 Qquskrjs0uJP8umQpCANmAqq1321YIqalLR9klcNdoSb2V54lMSYLIVoOkIe86nAcO43/
	 plD08p+iwADQx9T5GXFyRL+1Sf7KtGPxTuloGZQaDKbVTmBZntc4+liLhDaGgHj/ovmP3
	 rG9lyegNCQfsB219ByVCiXyJuC/qniLVZyjkbzDPPCMeg1eMmIOSi/l8+TtipTg6y4kQo
	 rblDNhOVL+T3F/Ks+/F5yJsV6UZzIEDPHU97XXcghm/QPZSCNWjPd+vLfkrJH13QNhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792587820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IFIcQphi53bOZxLB+GNkW2EIScxvyOCsyhvZFCSrmrM=;
	b=rRMQJVYKSI/pkmS+qi05C6f0+q+POvKa2gFKr51V5NN6ib70UpE7D78MM7OSPBrCaSQv
	 XDUEv6J8iHAi9nqeVZNk2vc8NycNsB8qwWRJ7d+rYo9ENT1rchoyDSsO/CtApBmxOwvqd
	 rqqQbLykqAOUEUUrlwrfRa5/C38KUzJfZsEJIzLTCKe97lr4e2MToItpam0lnY7ouECOX
	 HA1CRWZDymzW6LR1eyUttkTIhwUA8Af/KPMqm9cCUqEdan6zlkkD6sK7JVKsqieBxgpm+
	 IWvZEuAoh7+zPlM9aWUXbOIgXn6QjmQryBzEZHDxAjdeLIeN5VROCYQGG6vbctZgxXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OqrRV/Dd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xd4QSP/P";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7575A1F000C4
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqrRV/Dd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xd4QSP/P
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7575A1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7ci3225034
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IFIcQphi53bOZxLB+GNkW2EI
	ScxvyOCsyhvZFCSrmrM=; b=OqrRV/DdoeSVyBQ2LDnmuh8sA3AE0uHvjURg8LCo
	Z8zPtYGbq+F2AJbhf/nobkfsT8oTncQRPvbzFN/w1VxiJ4LS0iwKPGpsxwu4vQXu
	D7qvKfu4M+gk3mpDRn/6dxJSuIzdGjZDdCSLQ2rylJOS4Y3uYiJd8pl6HVQ/eutu
	qJQvdcd8eTfhCwpunevyjX4inQputKeW8y+9SzLKf0qCsj5OC/9eIwionCfB3GM6
	U2EYAKKwuAHlm8idLXuT210XO9rZqyGNPPYJGdsm9WJ0KP68Bx1jSlprRZ43cTpx
	vqSs7+OkdAWR3Sr2dqm9W6zMrngqfQrgirAUJEgFfhWEZQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy793t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 13:03:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980b637ed69so159452241.1
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587817; x=1793192617; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IFIcQphi53bOZxLB+GNkW2EIScxvyOCsyhvZFCSrmrM=;
        b=Xd4QSP/PqQT5KHyUwdq1JLL42MEMY7Q3jQlHwX0Zk8wlaLmrTPaQ7nlBPqgkK4AeL0
         ObQInZXrC5SdWZEAYzGbKW4OVdbUNwTZDzmQHD5NrmNamakN4mxSVpPgErFJ64UshrIT
         dj2QQN+9kCexzkZAqcI73gcUb4FibeC2qhrxiUwZodLL4uG0Z/g21xNGTrQ0qqYJ3VCZ
         QiZ8R2fT0j+D+PcuUhWt66XkKyTsCsBpvn84/Q0NaBv5shkTHqtKcbZYByeN6ggrOu+1
         K+6smtr8lvdgrIrKn1HntZPcNnWlC1hK6Tozvivs/mqkjFMZyscQ2PgRZED7aNVsslvy
         8M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587817; x=1793192617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFIcQphi53bOZxLB+GNkW2EIScxvyOCsyhvZFCSrmrM=;
        b=uPU7QFR0OKnaOsWAECGRFiYgTNfOn6aO2Ikg1tjMKyix7fq0mbfto4+QZfpEgfM3+M
         PmVcrJ8xf1463VqDvlK0/eIMoi3XmCS+JuRTfKN3D6zMVmuUZAZk3wWyz686DxKCGBBr
         NTp5ZfkZJjSl2pZiSlT/OeXXK7AnrAS6hOH0UKj8UmKLFMzRNJAC6Sl0bzLoxRtNIUk1
         l+fRe8LqRMDof8y4gFkfw/raXkPZZMplj5T+yWz9dtcOFgYN3jT+j+ZdUXVq/CUp05tc
         pvdeI+Ln/bNmSmy6ko8W1h63TK1wZhn3NzaUY9U8EKiQ0iZqnWD3dHvTOXmuN75RIc4F
         nq2w==
X-Gm-Message-State: AFq9FYJ5T1JBi/unNVAQDcxaobddSc/3pzzQ/SO8qQqYpbLPU5w49KVs
	dwDaJmzpDRl28gAANNyqorzQNbFI/ubwhaGgNpGGml/7Ohh6jfxZajPyK4g7Sz/QZCxGurfMUgT
	v1JK8PTbsyH3c5H2K1fMsBYiGUsYsIt41bhPr0/0HrMbWeOvC86LP1pJ3RHdJPbw=
X-Gm-Gg: AYBFou0/6mkPLrVO4Ty9ZXgn6XK8cfB/t3NJk+qV0kxCPyHk5cFNOvb07oIjprhaCXe
	euY/6i+suzJkwGPA1U7aD8WsAGFHN/zLUB/mqVKUFwYeqjb/wimaUKPWqnTXn5K0ZaOCAzWbDnL
	YYK4WeP8Iw4yW/QDklNsKXtCo7n5rGSn5hWpownJVALBC/yeICUcNiOmvUsilDqrdZKiuGXZoWw
	NK+z10QKntzgQIg84vetj20L4PZMo/pCcW3ht2ID4c6N/4r7e/ILmBD1uxQYwhWbKYdLlJs9kgy
	D/fBtEljNf6SryjxVqehUucybJfCQxQd9lJ2DI1eqaCgzPPk/5anoJZt8XeAV+9coi+oUTcIO+N
	ZcYvB6Fl5V8xd885NXJnwRp2W8JElahnzEyJNHGXK/KlWt1I63Orz9Gbul8LIP8P4TqNy02LP/h
	KRV2SeRSazjQp8
X-Received: by 2002:a05:6102:3e90:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7cc9247cb6dmr656783137.4.1792587817098;
        Wed, 21 Oct 2026 06:03:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3e90:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7cc9247cb6dmr656720137.4.1792587815225;
        Wed, 21 Oct 2026 06:03:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac437a4567sm6844091fa.23.2026.10.21.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:03:33 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:03:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: Re: QCA: Update Bluetooth QCA2066 firmware
Message-ID: <tv2svwbsb5s5ezhyrhpyud7ducjq2z5ikjkoxj7jakfdgwbt2i@r4kpvvaknj3h>
References: <7849e6c2-9524-4e74-8800-0fce2c60705f@oss.qualcomm.com>
 <zoqzckdyfvz3uupspi55oforrtaj3gw5wturvg7pw3ppoihnvn@nxvqlqgdbjck>
 <0ac5a97e-02e7-4c55-9c89-e7a6f14da426@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ac5a97e-02e7-4c55-9c89-e7a6f14da426@oss.qualcomm.com>
X-Proofpoint-GUID: EeR4uSTXVVWiC_Xl3gzIX9pq1P8XR3V6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX6H74oCJgwfc3
 kX0c8kfKjXaStRA0JMHAG8L6i4AByoYtIq6tlFsuHar2KMNesiG9YS8eR+KUpFEAPe8Qx0xYmWl
 ESLFojeok18ahoND6i2UVbOw41QsTCre5fIBJlXfU+bvOMqwPSQQSEcV0BcQvAUN/VQ84J7jqYS
 pYKDGoKTE4voCxsvPoznaYMTavLvBA5MFnpYh1rDaXC+arowXs4WxzkfNguraRSj7Y56lOuUAO5
 LQZeMcdETDr9k5py+3zciQMPpzWt1VkUTZysNUPDrQAGOd4lPtkPEg+Lqx/CZuZBeYqUF2LEi8F
 yG3N/xwZ7mYf19cMWSlV67e/5eju8FUeSqYM9efao36CxIPfcsUdlf+IXFOF729gTnwrgRoG+aC
 RiXwIpAJMswHqGo6AvyWct5HAi5Naex8YxrqectLEPuTrW9gBh5EX57Q3gS+QwzimRd+/pcbJVe
 p69PMlx8vzed/RglixQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX0T8cggVD3G/k
 jl721ysg1iMbCGUSdc/XhIw+Bv617Z3+rD8Se0qNcZXsmNKrM1ZNNuP8NLBvekX0Q10Rsyy6MiH
 F/4KRsu4cC7RDGvmcXv3xh/HFQrwQPg=
X-Proofpoint-ORIG-GUID: EeR4uSTXVVWiC_Xl3gzIX9pq1P8XR3V6
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8b82a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=lNOE3Y37B2IfJTtYBeYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210051
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 07:59:07PM +0800, Jinwang Li wrote:
> 
> 
> On 10/21/2026 7:26 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 21, 2026 at 06:35:59PM +0800, Jinwang Li wrote:
> > > Hi linux-firmware maintainers,
> > > 
> > > Here's a pull request for btfw. Please let me know if you have any problems.
> > > 
> > > The following changes since commit 9a80a04181713da7f8187ec928c15160137f3262:
> > > 
> > >    Merge branch 'robot/patch-0-1792477420' into 'main' (2026-10-20 12:07:53
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://github.com/jinwli-qc/linux-firmware.git update_QCA2066
> > > 
> > > for you to fetch changes up to 7fcdd92bd8c7d2a57500702609059ffe03407743:
> > > 
> > >    QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680 (2026-10-21 18:22:48
> > > +0800)
> > > 
> > > ----------------------------------------------------------------
> > > Jinwang Li (1):
> > >        QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680
> > > 
> > >   WHENCE                                   |   4 ++--
> > >   qca/QCA2066/nvm_usb_00130201_030a.bin    | Bin 6917 -> 6917 bytes
> > >   qca/QCA2066/nvm_usb_00130201_gf_030a.bin | Bin 6749 -> 6749 bytes
> > >   qca/QCA2066/rampatch_usb_00130201.bin    | Bin 160124 -> 163332 bytes
> > >   4 files changed, 2 insertions(+), 2 deletions(-)
> > 
> >  From your diff:
> > 
> >   Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
> >   File: qca/hpbtfw21.tlv
> > -Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
> > +Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
> >   File: qca/hpnv21.bin
> >   File: qca/hpnv21g.bin
> >   File: qca/hpnv21.301
> > 
> > But you are not changing those files. Please correct and resend.
> In the current linux-firmware, the actual firmware versions are:
> 
> qca/hpbtfw21.tlv: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
> qca/QCA2066/rampatch_usb_00130201.bin: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
> 
> However, the versions of these two firmware files were mistakenly swapped in
> WHENCE.
> 
> This patch corrects the version information in WHENCE and updates the
> QCA2066 USB transport firmware.

Separate commit, please.

-- 
With best wishes
Dmitry
