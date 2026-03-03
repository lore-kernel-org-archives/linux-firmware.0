Return-Path: <SRS0=Z4Oz=BD=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E4AEDA687
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 15:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 508B0C19422; Tue,  3 Mar 2026 15:50:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EE8DC116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 15:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EE8DC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623FVwd51060835
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 15:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PodLgrjT/E7aZ0fNebx8tj
	y8bSSUryDchi0CsyMzLI8=; b=YUl2Zy8TkFgU8Oz/EQUnNkIPO4o1hl7bNCBKLL
	fK56EkY2XK3oP227bNbLzzhrJuj30PGYWiE7Xs4HIT60q4hZSj0MDY9SVrPTyxcI
	mHnQpOnLqb5BP9F4lB7AscYqR3uc8wKiuxppZiJ5dmbIpUqE5NrWIclKSLTMmInN
	fuybB8Ger4amn1jF2dBhQQlnEQiBV9nEW5QmuVxNJ99yzALIrp/1yRo1ReDd5o5r
	mQZunHyNxKzV6SfKqLul1VbuUvNMdrQG3LBNSfrB0h4CWufvSz3o9+wHtFbBjAzT
	t3CRbPvkp3GQq6WmPe67GrQZcQx/QuXh2Ays5WqSG1m1gSow==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9g212-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 15:50:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso6368061eec.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 07:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772553005; x=1773157805; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PodLgrjT/E7aZ0fNebx8tjy8bSSUryDchi0CsyMzLI8=;
        b=B4asggyeQ5FP8EvRn+CGBhScOq6W4e6Y5o93/iebkRqw79L6lPpeU03Fa/9lOCQAD6
         yX/qiJk1bEv0tDtvWvMSetXtjBVnmp+MWeaxmsbvT/kw9+1I4vn1UrbYOgH6Xscb971k
         QX0Di4CPN9UmOEKfN6vPAcZCb/UQ750GXAs2+71qAc7SSgpQmoHC44T3FX1HMPshN0mL
         TBakl870cXZ5AU5g+pRXeTmcn7dTpGmQCRfZY2DtTnt4Qinht35omUmnyaJG8oQ1Ccgc
         WaLBE/MaH+EV7VULuTWaxx/XEl8GCj6bceyNpi1XCc42xjfHNmDdHE+71rfGx/UgCmk1
         SY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553005; x=1773157805;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PodLgrjT/E7aZ0fNebx8tjy8bSSUryDchi0CsyMzLI8=;
        b=uWUxv5gO9yl8GqEX4XPdPvozsNBQNsXLhQ1Ks3Lqc4mwUEEfPoSilOjCeWL6Ro7QMn
         RhyP/Jigi7uqD3TvBbrc4jCwFgM1SUzk62iojdg5oqd2sX/UmzRZ71LscJMmWK4QBNjJ
         9Fz1UALteDOX5+8TpLstbJzVAS1F9d15jypwvcuMSxCVAkG1j2APO7vdiQNG3jXP3+y1
         fcvq+/dR9A5/GRftzWypjrRAVc/DsN6TWIzAOn0eRfK5t3oznkAiMnRSZZkC+XRhYOn8
         P2yAK58jWR0gFe9H8MP437CBswl3I6x2dEiIFMjBqQGtQmajJLFi4ipJj0DJmrDsWw/q
         4fIg==
X-Gm-Message-State: AOJu0YyTTrgvwmGQZaiw3mKKPx2QevwKJvoiW059JC9+nLYkxFwRfsah
	1iSz00Z0w35RXn9TkTMRGTFBH1vwvE+UJ3MPVMAW4pg+Z0DZXc/R94r90KAaI2oRY9IKFqzP57U
	vK4YZl8YjsHsH8sSSmK6xvjAmIl1J4x/4D8JhWkkObLyZqJPG0ubnN85JetY+RHMQHl05oaU=
X-Gm-Gg: ATEYQzxQEbXPHrvoh45+hPr0etvn/KKEzxRRaBzs1bjMIdP0Kl+g15eRTfL0X+1rKlC
	YhKcBMjxPH3t8TX46F77FnSQSOJruWN/fT9wmZtqOT6fNTk8z4DXbh2Ig51mb8dSvHL/vtwx8CR
	ZDx/CaklKdqVytiGGfBieDAkhFlV48f+ffBYwtvZEMgxdJq/lHeaA+Z9adXuVSZ/uoza50DuZVQ
	kWQyjlgl36q26dA+ovdReL/5+cg8mEz2kYmfz4YpInHEG1Mt1SltzE1S5CTFrYpKBTbLZuHaGKz
	QcaZIRAqBWdiBX5BqDeawX/UBNeNdtV5veM1vPtXtTyonssMIQGKTPEQbu7O1Y17wqa8Qm3Akip
	kJ/LCDdA3CSau6ljAtgHcrH3TOiv6452a+0+zHqeyq6xP1LEEpZIFLjyNrS1jLEQGF73DD/sOq3
	Wo7cpeJxJ1gwk=
X-Received: by 2002:a05:693c:60d1:b0:2be:290c:8ad5 with SMTP id 5a478bee46e88-2be290c9cecmr426121eec.23.1772553004672;
        Tue, 03 Mar 2026 07:50:04 -0800 (PST)
X-Received: by 2002:a05:693c:60d1:b0:2be:290c:8ad5 with SMTP id 5a478bee46e88-2be290c9cecmr426106eec.23.1772553004146;
        Tue, 03 Mar 2026 07:50:04 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb5:45a1:613a:6456:f1e4:b93? ([2401:4900:1cb5:45a1:613a:6456:f1e4:b93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f23c01sm13324381eec.16.2026.03.03.07.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 07:50:03 -0800 (PST)
Message-ID: <6536e572-7fb5-4035-8600-3678dbe3731b@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:19:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP dtb.mbn for glymur platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX9g7F6yroVnTn
 HBdDi/Sj19GtZWLobT5RuOtQVZbn0o0f3dERgdzGCl1wxZB2nKfjfEYSl2/3Fdg2NZdMZ1ndm0H
 aImh/N863G6UQE1M9eDaLHUBYGxLo2v+PAagR2szarWU923ahcozAZTv34wlXp2DPuLUMp21cus
 kqsQ8tUj47w/6zZxm3LXdWzEMtcjDrskmDhzPRLFn3kDPscTONr6bzeeGf0CBqZOvpiI6YvoTqG
 28+yzUYUTvDV4ubdj7rxOT89LZO7o504jLILDQ6zQYDXqaH08KjG2Aax5ewwM2VPhvN9k+btlF6
 90uUHXwzjQPtQjzZ/7x9ROpwAEBfC5Y8NKC+O2q6LNGmjuV4lcw9w5nhgXaEHaYYXfJD3GqlgXo
 8MyMK8AyiJr2RijoSOyfGQnutf70Y7Dr5pZHHg9U3rOlaB8u7MDS/czWHLE56VAVsK0SsojeVL4
 srqNlMrczXPTvzE6xEQ==
X-Proofpoint-ORIG-GUID: fa8LC2ypC0EXv5h_-aQeSQCx5-PxuBoU
X-Proofpoint-GUID: fa8LC2ypC0EXv5h_-aQeSQCx5-PxuBoU
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7032e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=A2VeQ9hV0bsgSX6gx9kA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030127


The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:

   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-glymur_dtb

for you to fetch changes up to eb48837f8acc0c714dc7da556667b81c479ef4e9:

   qcom: update ADSP dtb.mbn for glymur platform (2026-03-03 21:15:04 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP dtb.mbn for glymur platform

  qcom/glymur/adsp_dtb.mbn | Bin 7253 -> 233272 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
