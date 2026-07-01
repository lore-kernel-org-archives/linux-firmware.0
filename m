Return-Path: <SRS0=7LK8=E3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E973BC43458
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Jul 2026 13:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D150E1F00A3A; Wed,  1 Jul 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782913849;
	b=hxNTCMBIGWk9gfTBsP8MQ1IMen6E6a4Zr5XfL6KboCcGHePd49T4SujjIFaq6fdRE8XX
	 wPan977nH+ikdOJN5+BI6XyeMsTeUlYSHhqg4P2/zsj6JXlvgycEERYmesv+kVFkqMilc
	 Wz+cCJiBIoGS794bZyaQWsE1ogxARjwAdqI8TC4f7Sj1hCTdEzrX1AuuEqzn4XNCPuMsP
	 rinEhOvJpG4nRHtZfTF6MRlStYDWuDDmnkcrjl8dr+NUkPgqUJuKI0pIVskdvJoez0Xg+
	 Th8eiLUohYA8XEsi8p23sbul7Qk8L2eKE99LwGwOx/OWJJqdhDLS/q39TGFrw0NVrpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782913849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pYtZdfgSPY7PSye/iYFhBLYIqsXtdr+alffqa7eyLhE=;
	b=SZvc3utrIy2N/oyccw4x+6cbx5xlUOhajrUrUiSHZ69rMXhxJ9qWTz6qJRW+j9W/mprz
	 oJHIYLolNcQSiNEyNMepqbMlF5uvlGqCizTsMpo0VDA6mZi866VdlvmLsn1w9B/Bj8hhQ
	 T5eeyIFQZcODB/YvGl+GrSuWipItPkaCItveTIpkccmf2FVArfUQWd2hajjDcqDaWiD2L
	 9USsFh/a5WGzxabBEqTXjdARRpStZ9sIuRsY0bpzz021vWkIRTVouxzsgdwJDBQX0iVrJ
	 IhcK1ALUjdJaVYw793sAski+9UO5Qn6MBQZVlKgIg6c0aeX6u9QFFOKoGuRwmP/yYAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aWBPSdtc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDMF5b68;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06CD81F00A3E
	for <linux-firmware@kernel.org>; Wed,  1 Jul 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aWBPSdtc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDMF5b68
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 06CD81F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8VZ0744114
	for <linux-firmware@kernel.org>; Wed, 1 Jul 2026 13:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pYtZdfgSPY7PSye/iYFhBLYI
	qsXtdr+alffqa7eyLhE=; b=aWBPSdtchrzCW1E7t55jcwLleLZ53daxddZwlSrp
	77x74FlpHiEbeqjDGE69azr81/O7ItNwoUfUKEW6E0WFhIr9xSEL5XB88yloFqBi
	JyErf9cK3g6cM3cguEEUIGD87SbcAnzHZLrcI99rOgHq89pJGhf8aw4KwIsUVXng
	ggDJNUaR+pbC0hIT8Z4wq1l3vCgq+bi6hoPMTb8ZKMZ0fCF/Ce1iKJW7kb3YrsYm
	jfdDAA/vHimpIrQ3XU3zm+I7HtsIwgGIjjkMskrYLiw0aVw/CUhy/lMDV3NF60gz
	kC1Y30WbHdA0EHkA0EAR70ZGCHMJJsU0RTb8Apz8GBbKMw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thsvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 13:50:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f73fso14245656d6.0
        for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913847; x=1783518647; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYtZdfgSPY7PSye/iYFhBLYIqsXtdr+alffqa7eyLhE=;
        b=TDMF5b68NZQk1t7PwjbJt235o/U1JvaRv8NRKDG3CSvon7TppOkg/JKD9nxV5QjvX/
         KnO+Mer3dY8acGKQ8IpIuK7+n6ENUNJUG/mJHTe8dfl/LsMIboPSNYzkGpxLQaF79ctz
         Xe1YgBwXGwrn0Ae3QhFYzSRykvzWUPiCyBKoOuR6SQtXmo45m+XeK1J/8qUMaCAbAvLb
         khXyFGoQhxrHfVghwz3Ky7+9ms952JT3B1za9ds8WyZ6LFTQ1DJNpIU96Sne6YHxlLBb
         3Htwuk51mp97g4XF8/FjyTIBYRcRhA/UmKn3H1V9fyE/2ea47HHLpp5CA3wPfLpEfxMh
         /wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913847; x=1783518647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYtZdfgSPY7PSye/iYFhBLYIqsXtdr+alffqa7eyLhE=;
        b=M5zqRbJ6oK66J1R0HvC0EEBSvQuXn7gu46C2+7xAYYMVXuF8kE6ZjqGEkYUnLfkoqL
         ZiXbO2Kwi1UlUre2n5TwYyQFx1KB4Qgdj+RkEfmRewQn57gmZMsokxKiJDwj9sr49kqj
         7TdHyGZUOi10SejpV/zZBlULnu5r0b7rL+4JjPVcuK0PywQZQLli6Pzx9oz6rZdSoE6s
         09jRpTCpjbTI3PU9bbMSBOmOr0Qt6V3988qlDBMY0VHPAS4Hnluk4fWjXoKCufU2ZF6Q
         HZWkM3XptINVNZXLTw+gxKOdJmL1AudvJyQmb/bqflx44QxLmoFcEgiW+44652WEr3P4
         mfyg==
X-Gm-Message-State: AOJu0Yw2JO+XjXOheVSSSZMc73ho8HaKPrePoNPOjFA+sng3v/PpDYTn
	MPMqjbIAuJjx4ipoaN3BYdJqf4Iu5P38BP6eVT1IoBQ+aPQmSE9GR0N8ZwNHQyYIGE6mB6YqdzR
	HxLqm1GgJOxMliw3NJJgMHH54AfTlwOugiJIgguUHmQ4RNYskhcHyP/ZAGm4H0Bs=
X-Gm-Gg: AfdE7cneH3d9DvNMDiepQuddteVTLDAPV9DJMP4QMBwZVMlTbrAu05HbhubmoGrPYPS
	4LuyjJnSycQ0FrImcMC2iByhrxaDSG0IUklNJMWOGbExfu+5/opvvieaAkwwfq6K1ZdrBH38jC1
	OLSylr1VMRNkHP/4pwg491twWEVVYbVSRmYA+aZsnzXtTxUn4qPnN/c0D0yRm3TrKoV+3VRyRfP
	tSdlwtTUNztOuLPhlghqbzGvW6tFLDOz7cvD0gomDYckL6qxbXv6UIJzpgx+THvsgvV/pY49k17
	/wbghFSUHJlLPdS7+CNncEXY95t26RsyP7DYcFojpUyDn6Hd5P5gzSVFcjkNMd/iyxGTLbZk+ZC
	KDx6MRMxOWfN9fERrqdANvegGA72K7fRU9unmv3Mb0X+Wqd3RXR9evjtJm/yLadCFLvNTkWSQ6r
	Pj1x3RHc1s+FeXIo0n3qPGuUV+
X-Received: by 2002:a05:620a:408c:b0:915:5379:b511 with SMTP id af79cd13be357-92e784d13camr251402785a.43.1782913847450;
        Wed, 01 Jul 2026 06:50:47 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:915:5379:b511 with SMTP id af79cd13be357-92e784d13camr251397685a.43.1782913846917;
        Wed, 01 Jul 2026 06:50:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37ed7f25sm31661fa.10.2026.07.01.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:50:45 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:50:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <k23d4zxro5di4p3d2decgufa7uz5zcagacvxinj6l7xmm3r2ov@hggdffelhzy5>
References: <CAPgfiAFB0TBsaHtmSJm3Xyj2-8u2Gr3sxCmb=tbvPG6vVAAYhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgfiAFB0TBsaHtmSJm3Xyj2-8u2Gr3sxCmb=tbvPG6vVAAYhA@mail.gmail.com>
X-Proofpoint-GUID: pl0hWBCwM6lvoDoVBTe9hcd15oeyUGJe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX/YoCyKLFpuqW
 Y7iugU1Q0xfEouCf8EWAYRn9xSTivPH62Np+Z5PoECj7eWEVkH/K2aN2g+Oy3NBzALQfIvEtU6S
 UoiNvXedSn43+oBI1/oP7NQ7idJBmu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX5ZnNrjn32cSW
 sZYD5UybQMuYZqZ9jcojggbpqHVZ1YtGkAz7rhCAm64lBxtX/C+wP6B2U5cMay/qHF92hipuBA+
 KqEBIhCnJj89JZymidQAMVm7ue1mJKag+MSPBfC65VA1uCWjvxYeXZ/UyWOSMfnM8u9Y8zsa3k/
 ca4QKn0a+jj+HXo/vIjR0T1pEQOvJiB09I8Fsqf0CkcdXxwcL7SsVBo4e3fCXU8UtPD7lJwP7KN
 PQ6/NV9QgFqITHLOxFhUS5AOpyx8WBBZ0XVQfoPxpm3gfa1U2p0GItyo6MBDNIrK54r7OJsZk0Y
 gM6zGlNOAa1owCyAa/b5riGjOhGnzyn7yUSY68o+BMgigumaMS4kJSUtGdnEFRxpYnrnq0FakTR
 jOYDRF2vKYo26D4/fUt2Nv89byYpRB/6vthMIMs8T0Tsazj6tlQxPlCxTfuh85xpU6jMDVYs3zw
 kkBmGCd1nMAUe+gFpzg==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a451b38 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qC_FGOx9AAAA:8
 a=4-EtBN1g4JrmlSURS-cA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: pl0hWBCwM6lvoDoVBTe9hcd15oeyUGJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010145

On Tue, Jun 30, 2026 at 09:31:03PM +0530, Srikanth Katakam wrote:
> The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:
> 
> 
> 
>   Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26
> 15:53:01 +0000)

Still ignored by the robot :-(

Could you please talk to Venkata and reproduce his setup 1:1?

> 
> 
> 
> are available in the git repository at:
> 
> 
> 
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git  modem-fw-shikra6
> 
> 
> 

-- 
With best wishes
Dmitry
