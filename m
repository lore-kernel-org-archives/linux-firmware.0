Return-Path: <SRS0=LdFE=EZ=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD5FC43458
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2026 09:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E84B1F00A3E; Mon, 29 Jun 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782726022;
	b=A3PfQIkcpu7lQyCz4ppOxrfkf+ASi+k9Aww80Yn1f/FmfzY9xGXrcqFah1LJ1RPgFbbv
	 UonMscCYz3LFBAVcXOLdLN1DElpus2MwwqE0WCEKqDVypkDY2AlycxvDaqIJ/QDkC1afJ
	 +NqIgHcjwLDmBpr48q1fzaVkWGanQ60dVx2SwUBaH5gOdmQX+6Qig8ZELsDCasqFyDgXr
	 yI4bty5vr0Cj0OnLJC31VTJ3+2ObJctnUz2KxwxCvxxu5dwqbVb0xoFytLSASxVAx6FXZ
	 4XBDWSgG91C4oo+gsGJRenOFN+sFJpjGD4dIt+wAqH9NPd0pWVwNhhfURwCRQNgetdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782726022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:List-Id:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C98KQ97hS3L6SdUyTJFRWUrVLXVVYq21ku4ozZZ2ZlI=;
	b=vBx8Y82hFcY+cMAUEdLFOFkeUrXoJdWK6G4OFfaYnbqy1vviTrxDhhpeCCU/kxrCb3Jo
	 8Ez5oYNf+YdNbikeAw5t7X+RMP7sES4DU4dVXO3qtSnepVK9Shb5thx1uornpsf9gZJHO
	 8WK3caSCURTQyg+Arz3c37MLHYu00DNCS336CFCFsl231QI9MAsM3dJ+bkCTkYylqU95/
	 TNiKbeggCUG6u/EZpH7f4mF9na/9lPX+K2BH+/Es2OCYX/mtYYwK2VBvgReYzk7Fx165H
	 54x7DiZw5qmFe9vqdKjLTvxzchBHKvEDh8bVXWmuOnULcRVbMNNl/aqYe0hEWQRJkAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qj19HvvM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=krGnONwD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 547691F000E9
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qj19HvvM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=krGnONwD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 547691F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sK7N2143092
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 09:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C98KQ97hS3L
	6SdUyTJFRWUrVLXVVYq21ku4ozZZ2ZlI=; b=Qj19HvvMa3Tirajyh4ZYkiLzgZr
	ZrvsccFLAwGHd26EXoO/AgaFIy1HG6jhscVatFXk5sf59tehXmk4iMVXH/lWu9qg
	5AqDLJYsbTBtlrvWqPkzCp8YPwQ5My8kuwy8YQpuvi3cCUhXhEx6tRs4ZhRaA3U/
	nqXDlLkEa1M0OwKaSIe9fhIf05SjJT7hh63JEZproOmsykdX/DwdmAQ5bee2JmQB
	Z6Efn2AbzaWTOmn+/7HAK7RyNSVvUv0enpAu2z9OLdXl3w9hMEOBLQNRsa7EVPrF
	3U97Tcv5FfTo77gh/gVH5zdIQIP2GPJfVtTjSu/o5uC93oaqhVzyXee+vRA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nusv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 09:40:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30dcb234239so178419eec.0
        for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726019; x=1783330819; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C98KQ97hS3L6SdUyTJFRWUrVLXVVYq21ku4ozZZ2ZlI=;
        b=krGnONwDQrgx4Wj4EhI4s30/h6G2Th8PYSLNYSiz5LOiVQfMGyedf8T8YUnDI7qwFQ
         iWWJC/gE5s08k4bKXvX2kYBqwx2mVHB4tFhaNvVhs7NTKHjPaTtubqH6PBJVBkP2jdW/
         5nhz2BwMBq7tNdblGdUiMFHb3+7WVjx79tLqsJjuoVa+z64kc+oqSfLi4TQDnn6fMBNf
         HT7CT119FkIGTyM/GhWkY2wDUWEEyzkSdj1rmfdNqNL+Y3vdBWbcra5IOstBykJ78Ah+
         vh4nlZx+uK06WYGbxyjG7UmAuEKdM1R0n/MOxixtXt2GJH23devKkdAr5Xzrjs/QnWem
         f5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726019; x=1783330819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C98KQ97hS3L6SdUyTJFRWUrVLXVVYq21ku4ozZZ2ZlI=;
        b=nGVLyPwRiX7oC8OhkLLmMXLsV8fVtl0tKrZjxDM21czjYelEK9y1wsdb02OX7JJDIe
         SQ2TsT5Y9A9jMbAstOzjpQG4eZGC6hLOT8/n4gPSDjgYaQIGmBrpOHkcyXQ7+qlTVbys
         btUnL/jei73YiZ6mo6onDYWyGyWrihqv2h+Tq1thaLu2lrMrxc+pxEFHMjAXnFTQbkM6
         INepuwsdTx8Hc9qSk5WrJjY4MQn3pFuY3wFS7akiUmY22s407GUlORPvcmm9n5fFmYmZ
         Uhzt1qpCt+X92mISamNfckyvxUmL0sHnyJXCvPrhe29cOkBSXoB57qwuno+DcHTIqAfu
         LCKQ==
X-Gm-Message-State: AOJu0Yzvpvepx3iOEgl+ZB/VXueEXLqWtPbccs9RnnMsei2V8y2J9y7L
	B449HaQakXv7UxojT4TO5dTyeUGMINypi6OTFrkLTyrDg6bt7oPROVqTmvqaFgqFgI0TBxmu2SJ
	dmQXka/Vq1CDmM+vXfkxkyt10s3nXppDw6u5KxGU2BmAcZkO4wC/hmm96bH8Muks=
X-Gm-Gg: AfdE7ckGen4rhWnSTl+2jbcmlT0mfzmb6acomTGj8AkALV+Rs/Ka0HVCUxnY8eSoKdi
	8OSSdls6Z0K25PRrnYULwh2Q9z6CVOug14Ofyh/gFIvwXF8qk8XtaXItOpXd+EROlID6HoxP7fy
	u/XP5f5WO2gGiqiSGnuSWFEY1T8ecesusKk4pGcn5BS4Cn5pSRlXWW12rk6vjCrEmRMJ9eR2ngF
	P9ZNIE9THJXTiQ2mwDYGdA9TSEVZon6RGvrRVcFm2QtWvcAZ1EflLqD9kZ0Hwt6DOYHNXcIeZ5p
	VHz5+fg7WC+DtPelL+rIx8X5r+wID217ao4a0twF5DUT7Y0q+NKEtQt86RyZGvcTIE99CfIYmIK
	69gDcnhPzmsmyT3aZh0Ww3Y2xdpvkNWO/7+3LDmyQznl1dOSSdQTJNkjUsId9Uw==
X-Received: by 2002:a05:7301:2c8a:b0:30c:39b3:292e with SMTP id 5a478bee46e88-30c84d00b52mr7035494eec.3.1782726019275;
        Mon, 29 Jun 2026 02:40:19 -0700 (PDT)
X-Received: by 2002:a05:7301:2c8a:b0:30c:39b3:292e with SMTP id 5a478bee46e88-30c84d00b52mr7035481eec.3.1782726018676;
        Mon, 29 Jun 2026 02:40:18 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fc2ebcc0sm12081533c88.14.2026.06.29.02.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:40:18 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Subject: Re: [GIT PULL] QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00072
Date: Mon, 29 Jun 2026 15:10:15 +0530
Message-Id: <20260629094015.3842672-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAO9ioeV0L54u-qajqDoBJw6tPvDUBKG6LhX8VhmmHFE=CbdnYg@mail.gmail.com>
References: <20260629085830.3810576-1-wei.deng@oss.qualcomm.com> <CAO9ioeV0L54u-qajqDoBJw6tPvDUBKG6LhX8VhmmHFE=CbdnYg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NyBTYWx0ZWRfX1qikhLNClt/Z
 Yl3w2wLgoennjqjjDKv9xhQbz1eNx4S3iyA8+k6YdII2u/XDK8YUyrMB7yp3KBFRMGKuipgeejo
 m3tAQPWE9lfevaxNcHoOHtEJq62L0Zs=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a423d84 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=ujgq1D3FR2SnU-RKctMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 5A2SMw1H8GILMYkh8K7GMBV3kPXFwxxo
X-Proofpoint-ORIG-GUID: 5A2SMw1H8GILMYkh8K7GMBV3kPXFwxxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NyBTYWx0ZWRfX/YW92Aku8mF6
 HE92vq4S1TVR8tgkpvqvx+szAWcOZIEpjBASJZrUUPhBuBPjiWRvznePxGf/IUHIDXZoRBXs3WD
 8jZqZ/3E6fxPc5S++DoirxuGS/mX8qvFG1u+oSA1mM1AMPJrnz/sLEWRSzExa12duAWoS33Hf26
 pGK588xvUpgVfbZRg8nvZsSSnpK69mMz2VV6xRgfKASUE0m6NXFFr+/5RSuBuYv8GStKMs5TWjV
 H0Kjx7gdcyfTDbcZQYwWvSw9lGPkHbF4ajsGVtnlTbMYKGqJV82qQ0/dlPdmTEcC5gi5K/9k5ke
 TAD4X+faeBKdoeS9vwS4sYuLPKs99FC5ivtVOpAWLS9amohJ+JHdqBRmGvhpysbs4+j2Mwlnqa9
 9fDyxqzdCq+Jb7fHpReUJsOeeuq1rXxyKo7SWK4bfkN7pQfdKVDrLx5gnfhNIb//58Nrt5TKbwo
 knRmYFHLYHYWTW4f84w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290077

Hi Dmitry,

On Mon, 29 Jun 2026 at 12:28, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> Thanks, merged and pushed out:
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1128
>
> In future, could you possibly write at least a minimal changelog to
> help distributions to understand whether the update is important
> enough to backport it or not.

Thanks for the suggestion. Will do in future submissions.

-- 
Best Regards,
Wei Deng
