Return-Path: <SRS0=QCDN=4K=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA3CCA470
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Oct 2025 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFEEFC116D0; Wed,  1 Oct 2025 13:06:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7D7FC4CEF4
	for <linux-firmware@kernel.org>; Wed,  1 Oct 2025 13:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7D7FC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918wHuZ020364
	for <linux-firmware@kernel.org>; Wed, 1 Oct 2025 13:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wgwmHjMpEhNwc/KIH62Dip
	cRxEbk02bZ8RWGS5REqpA=; b=FnlR3SzwTRq+K73BT5BRtRmYvPj8pXScMQJEpt
	dUwdFRnfOR7Wg3/7HOEu6oqZDNVSvvtN+bO6/xeiB8/bk9AFNJAPDoZJ80aKXuJb
	BlfmZ/LYljF/F4HHNZ8aDoErkWEOVfW+6Exb3cRc/BgST4T5LN+KUlBtxuhuJmF2
	70PnQ+sI0VtzJNXNtGtNWehsSuF6pnYxWO9WX/5sTctINbGsum0Uzoq66IZjOprE
	7+FjWlbbBfgob13yWAHntAPB+SBWgECw3nkR3a0nT4dXdkYfNPPzhjdwx7PNrI/v
	V2IAxyeLXdRk2rJlZtYnLsXv0qy3JP+fYNjJVIV4YGFT7Tpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5vra1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 13:06:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269880a7bd9so86829805ad.3
        for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 06:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323976; x=1759928776;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgwmHjMpEhNwc/KIH62DipcRxEbk02bZ8RWGS5REqpA=;
        b=DGXdfpBAuxpzeR5ckDgIJTE43XRBmOsTT2MvuRRPfs/6cGtRxlddxf56VVTsEz9WwS
         vqllgvfydRnGvAMV0PPD0DDDV9e9cH2SKWm9A7sfrJkF8QnChHeTcZrFwX3nf2blUgq8
         yhxr1JrpZJ6TxPRKvh0H8Eh5meRy7ndYiLTSWifk540pMeBXD/y/Q2lDutfavA4ksU1g
         vu1XwQal7+7Fb7dx9XLl+Zg1wsKgPuvKxhJ3+jmg6x2obKu7jGmcwKpyRmJE1+Dn1Aq7
         0wuXBPrEqRuB9pz7jDtqI/V0KGcfp7/QoOb3+7cWNqK4G50n8EmNiKqungEBA0+Bhaez
         qAVw==
X-Gm-Message-State: AOJu0YyyyLtU3wRqkUFb+zz0+Vfp6Jfq9n3Kp/e6bzioEkWj565IhGu6
	GJb555tMU3n9CZPMWWGB8uKO4Abqei79Gm7n+BnbgkYlSX1YiMvj4ipReZqBIRlfoFFMXnReilM
	36ARspwtdzQx9VipTcfrPq9OoSb0l6nXHX5prw3TsLNNq3I6J8XyVm/2NlxLdW/SEsCq6fXg=
X-Gm-Gg: ASbGnctv5bqDnzwvsPPK8uNepOs9kGAW33fERmUs29e+ylXrvr+CitsTlX8mKnMv3s2
	mkOUEGr2ma2OVtnXsVSoun9+mgSQp5hPr6cYT6yEKk+097jXc9XRjfeF6IFCbljIQmwtvzQKJkz
	emFbPq31gVSXiPURwzNEPG5KTEWF4sif68LI5HQ6goKUWsp3eJJwYJptH2Ma4KWn9uy+UGCwCtj
	IBsJVVBlxLK9rThk6NBb/V8YOamJL6307tUTUcL92sJzMy1CzfhC7Y48RL0o0jcH/457txxnW65
	0UvR8qzHM4vkXT0aIKzW8Dn0rwtrji+vJ+XhP9bzf7BKoNSpkneMfZQlLEXBvPf20bqIgxLABa2
	KJwI=
X-Received: by 2002:a17:903:1b46:b0:27a:6c30:49c with SMTP id d9443c01a7336-28e7f2b59c1mr43831565ad.27.1759323975762;
        Wed, 01 Oct 2025 06:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBQBa9vfhrzksAv43vxr2KNSBFyMeX31eGl40JyXdWZAhWpIrFoIyhBD48XAxZCUtTsfVIKg==
X-Received: by 2002:a17:903:1b46:b0:27a:6c30:49c with SMTP id d9443c01a7336-28e7f2b59c1mr43830955ad.27.1759323975214;
        Wed, 01 Oct 2025 06:06:15 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed699ecacsm185909185ad.109.2025.10.01.06.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:06:14 -0700 (PDT)
Message-ID: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 18:36:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: add video firmware for Kaanapali
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hr5GkS0mJuQk1m7v2lRhxPS8VOUPitz2
X-Proofpoint-ORIG-GUID: hr5GkS0mJuQk1m7v2lRhxPS8VOUPitz2
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dd2749 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=WbAErClFF2DWAsbCIgsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX6mbyQ1N/RoqD
 xN9PtGeDOwmWa5p4cLdx/F8p9aYHFSLPkX+ipwzUIFgxmdhX+CvzNZuon9LDmcB+wLXsVC4qZpO
 gPQknLRFkVjxL69OOswuEHmJPFK38qKraxFvuCqyNaO7BvebNVbt1pDTsN70JIBTdShgwr/3t/7
 Y5ptVv2eYSJGCtIIZaYvf6kqoayQzoFiZEyYCnls8eulT1rNjc7h6VedXnEVpUqXHrzeAkxYNqS
 f9C8XmJY1XmkEjyGUX+zEzKwlsqLMlZvDRx7tDlpxeKiChFEQBn7KcBX1IUwRs45x6Nw0LKs+7H
 NT/MX0sk56qXVrfGmneWfIPF5hGleE/b2GpAcab89HbLN5IZOmkDqLP8zpXhwVvM8M7CO9r4Xhj
 IX4RU8g/HqDAQtHRm93BWssmybBzrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Hi,

The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:

  Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-kaanapali

for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:

  qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add video firmware for Kaanapali

 WHENCE                   |   5 +++++
 qcom/vpu/vpu40_p2_s7.mbn | Bin 0 -> 2474696 bytes
 2 files changed, 5 insertions(+)
 create mode 100644 qcom/vpu/vpu40_p2_s7.mbn

Thanks,
Dikshita
