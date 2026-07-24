Return-Path: <SRS0=WkCB=FS=oss.qualcomm.com=srikanth.katakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED70C531F9
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Jul 2026 08:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0C351F000E9; Fri, 24 Jul 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784883111;
	b=oI8Nah0cfHG9b/ENqrTAdINYE/sYbNczNDkQvKwL22SffoYL7FbjrJROc+sjKYa46/rE
	 Ce+CwkjtEPXA1R6it1MJWaJ6xbGACaBMN5T84Qnvg1cq3BpAJNwjt1BXAxcoFsmQXWR5n
	 9yXJPZvIa5C2bxJzNxR/vFpRiITeCQEV2nOxj6dBwuqKYCjMqXD6MMYCtCxKSaMQSeFAm
	 kmqvkGBp9ulHFen8CPgDqaRgm2IJJX9Pxc6lrzlmkU6bokNZWDL9my9jpxzBR+vaG6wsv
	 13KYY6Nnskt9WwTQmH+P4/X0tWGBcmcUm8Q2bxmJJdSsPqgsASbZm2SF0umuupIH1/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784883111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YHE8kg6sNYj8jPkcD+ic+vyoQKdbKaBj13PFK9P8ZCE=;
	b=p9LJvPEmndC6f5zdtSxoi5fje4zpPYQ/rvJb21td2pXNH93sItCjITpbG9EgxFVY+mYa
	 hko/sy1qOaSr2JnKixVT4TmgG2OvAEGDPgblya/eSwNaNyufWMKNlB0Qa8HUQxcnE+5T5
	 Z5Z17Yhfl9PtS39H6whS+x2iTGrbyoawOcEvgwVA6cRR+5hU8DXbLKC/mKUxJFmHE1CjC
	 DmSg7vjTpKE5ihtTcfc8NJ21pr2gffawGcTIOohfULQFpgaLu2ikKQ6oZZZm7n47PRZPh
	 lScKojmOx9a/SA9+Hnii4YSfAXqFHBuCBEAd2d5u4aguoi27hCIzWD2vHVgGy4o2JyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TaE0McLk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyOqgq+f;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 086C51F00A3A
	for <linux-firmware@kernel.org>; Fri, 24 Jul 2026 08:51:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TaE0McLk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyOqgq+f
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 086C51F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lKqS2137669
	for <linux-firmware@kernel.org>; Fri, 24 Jul 2026 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YHE8kg6sNYj8jPkcD+ic+v
	yoQKdbKaBj13PFK9P8ZCE=; b=TaE0McLkpF4EOUpyQlNn/kajhU3txHoZ1LMOnB
	xPT17GNQZ8jf3jRfh2yxCjRFEJa5pQ6D+gCrO5QMhCr+ry29nUZb4JUtOfAjZr6k
	/ZT41yXX84gZiMKLAiE2UrW83tnU/031XNrMAMLK+zCeBeok8QUazZaO5eVyY5gG
	z2ziyWurlh79i1uzzDK8aW/+RO6hnco8RWdyHq3gQw7tADctC1G2En6UenbJt6kv
	HDqXJ86RUsAHw8FH+pz+Sb5RcxQcYGXMmq0dKqd+bJ7iDnaUyMjM30AVMyO7Skwy
	WcLfsh8S4W45ne8r8mwC89gjUc6b209y2/6VNfZhdcgJD1mg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1aypb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Jul 2026 08:51:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so3659885ad.1
        for <linux-firmware@kernel.org>; Fri, 24 Jul 2026 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883109; x=1785487909; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YHE8kg6sNYj8jPkcD+ic+vyoQKdbKaBj13PFK9P8ZCE=;
        b=jyOqgq+f9CVCCMKPtChIHCkymdv0zdoKRD2PrXRju+OnDN/EdATOjyJkY3S8jlW2wN
         /4itT0GKZAA6TUaoVC+8lgaHb4+aSgPuPWZ1+fSIH99Tb03hO0dEsKApU+JgEUgg70q+
         QwQDgyViVJSOI7VsRLY66mhPjEsTRSMyi+KvujFkjzjlWKeWwYI0wFNenuGALFKXZZ8V
         poUGfaVLHh+kv46kC+vZIuRbDfLNbWiTKaQEhZ7C9/IHmcVZBduqHeMOlireYjHyQw42
         LMsrIOOMZZ7JW5dUPzpS82iL9ub6GgKofiiC03uLJt3D9kG5oFvgbF7O/nPQVryd+4i4
         KvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883109; x=1785487909;
        h=content-transfer-encoding:content-type:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHE8kg6sNYj8jPkcD+ic+vyoQKdbKaBj13PFK9P8ZCE=;
        b=m/HI6BuYOHdixFTC2p27KK12z5k3mQLpgZ5syN+KFiJ39XM7oX2abIM+pT3USoA3J2
         DKvs3179uV+sFcVOuaeeg5ua3OiiXvH4E6SnClydwCe/P/trkcM0jZ2CHpasnsqj/HVX
         qhdolZrAqQEA2Mfu305J+2fgI66s9krIcRQ2ERJSGawM2Riu3/eLGBIMbjQuzLAQ3Ldd
         0fbUqa5tCCPelauWw/SRSgfLKpVXLYqFulRHcBvMM8Cw+8XZG9aKSFE2n4ZPxlXPDQ85
         0W8xwSILq6VDpY80RIHXR2I/kGrji0YFm9H0XiFYHyTHNGDkl6H1lbaYwsZlWWjUIqMD
         l8+A==
X-Gm-Message-State: AOJu0YxLKGTJm+RQKaLFJ+Bxo1GXu4aKZvFK5bqgqrscayIZzBHCXERn
	19iurth/YhmE5cYRdxgFVcnxvth3+m7TfBLNd7Y5br/5pzf5mmBBdqqq6eQtwqdeJWH0Hv17/bk
	BtAeUGSBB9T0+QLVb9IEkkDdKrcaOxb4LEFevxqgFm52MpdDX92d8bQWk+l59bWNyzXMaYoU=
X-Gm-Gg: AR+sD12HDzAnz3FUaEjMPhAdzMp3qReVHxbOJlo2HdndgViI/JpUjqoF6Pi3tLm0eRK
	SsW95hFZ8L4FJPejDLg3EHesc69ZGCJbSyEuVrWK/+lsN5skKcV+9bm+UZMigsheqoyhNE9INjw
	Wdiy79WjygmMRETXKYscxcI2AAvCNGX19azS3Rl9YDI127BtiMI0mCrmSPESU8h1mA1tV3wqQjp
	G2dTKRyN5X1oUwXmtZF92WMdDpIfZyk8AW0q57XFRC6XYH25q6uHif3KC4Tu8HHavCNr+hYZyLX
	q9WblRC79ZxRRSDPwJSpkQ/p+vVf+Cchm1oKcJ86FCu5iZQiiiF78C4hHX37T56SrmrOHWx4bpU
	4l1/FpQExdApw/4rw4B6Gn9ZJv0jCWrIDMg==
X-Received: by 2002:a17:903:b08:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2cfa6bb6205mr79142385ad.21.1784883109499;
        Fri, 24 Jul 2026 01:51:49 -0700 (PDT)
X-Received: by 2002:a17:903:b08:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2cfa6bb6205mr79142215ad.21.1784883109064;
        Fri, 24 Jul 2026 01:51:49 -0700 (PDT)
Received: from [10.217.92.69] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e9066sm49162355ad.43.2026.07.24.01.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:51:48 -0700 (PDT)
Message-ID: <6f003249-a132-44b9-95bc-01dc6ee00e44@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Cc: dbaryshk@qti.qualcomm.com, raghukan@qti.qualcomm.com,
        vkasinat@qti.qualcomm.com, rajup@qti.qualcomm.com,
        kbajaj@qti.qualcomm.com, vkraleti@qti.qualcomm.com,
        saddam.patan@oss.qualcomm.com
Subject: qcom: Update qdsp6sw firmware for shikra platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fntd7uYCOnTDF4TrIJ3F3bFm0TQPu_Lk
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a6327a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=q-ed3GmFGT7nFBCXlI8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfX3pFjKg+fvfom
 5/fqe1M1dOlBSKoA+yf+HuqgeK2mYtJijGcr3PI+TiRAUD/6VbwUHvJVdIYb/JnZwVRsAcpa1Xb
 DuYumkYiOQcD1TFt5LQK+IXox+NCEHtCP2VNWmTWDwRlpx+s8+YpbjgH/hfBQfw5ON8oNp2Xh2T
 sP5wTX3o6RApQ/ZEc0cSdmfRnPdKJcz20UbMBX0e+oyOxC14huaTBfDy0vdyeIqnhbmLbaZ5afS
 m3Oji7VNChKwMn+rbhIqboEx1MkiELEHkHXVFC3Ixkmx5dJR8d9G6CTKyBv+1RkDA2lThRvhz5L
 f//37yawAO8HaqaAIr7BODE1hv3cyljmN5KKUZ68pgSPwtxlQsCPUJcMED705QAI7AFl354pCRS
 1FmOmUNeLUjulCSNNzrxxGXp8LZps4y0r9+5fFTxXgnV7qfflxVFm+D4tfv29bvN4cKTopHQH+T
 MRYfqza9n8vtnhw4CBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfX3KXX6S3XZ6di
 ddbMeAV1aaHM2IdIjcmvaFvbj9GlfQXVXNRrblSj8AXNEy1d3T8m4NKRTHJNLQEfaqZsN0ooTJO
 Zur+nuSN5GrYRbOoXPtlNLzM1/Qknf0=
X-Proofpoint-GUID: Fntd7uYCOnTDF4TrIJ3F3bFm0TQPu_Lk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240079

The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:

   Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 
15:53:01 +0000)

are available in the git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
modem-fw-shikra6

for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:

   qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 
22:26:52 +0530)

----------------------------------------------------------------
Srikanth Katakam (1):
       qcom: Update qdsp6sw firmware for shikra platform

WHENCE                      |   2 +-
qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5709176 bytes
2 files changed, 1 insertion(+), 1 deletion(-)
