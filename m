Return-Path: <SRS0=48T+=4Z=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFE3CCD194
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Oct 2025 07:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE6A8C4CEF1; Thu, 16 Oct 2025 07:06:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8EE0C4CEFB
	for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 07:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8EE0C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FKJAiG004012
	for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 07:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lkI1xEarN+f3I1vwK3Lu4/
	rwsxPjJ3xPhQJb9DkZAzE=; b=JsSvMVq5xpTNSvtb+dSbsJM3cADsioZ/Qln/vD
	O8SUWuWZ9o/SKD7QhH4PtUHyTDkGgCVqPH1/VvKfbKKnRv+dhqLgz2gLeltwJm3b
	yW5pT4RLtdTGJ3iG2ZtoWigT2Ff0jDpcyDupIAz7OWhIQabQB012hdJ7fAas4GfN
	c3Hnl9nqtTRAqpzAxIYP5i1cKX+BJ7Q4ECCvQfEX+K9AOuiRL147LsBN22eoatVc
	JcyaoF/rQAksOTsYFjADGaB2SxFxd+v4aHhDxLkwaUU3QikjTTo95dYvI7SHDA7P
	l4qEXO/shNnz7V6RcLRKz9k4cVIZ+Ui8QSvIOJdccUpktIlw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg76pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 07:06:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32edda89a37so435110a91.1
        for <linux-firmware@kernel.org>; Thu, 16 Oct 2025 00:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760598368; x=1761203168;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lkI1xEarN+f3I1vwK3Lu4/rwsxPjJ3xPhQJb9DkZAzE=;
        b=IoGeZJrWBEmujejlO9n5InqCrK0NfLcimpN+Yss0JcJ0Iw8eQqpojec4OssISAUiL1
         UmUnSmSoroNNGbEDkG6N1KV6PO/aEENSPUksePuNzsYsagHgsrGS+AVhNw/ns3GNPeyN
         utQ0XiOXBDNJn/h1UKEPqYLujUkH0lkhP1L2zvzkYT0xnPTwPs20C5Vw4EdA6uDdJEuD
         GdxRc4IwTzoVPdv2EoZDCrhhghlRbuAI463lXO5TQ4OV/XKMja/FvrU45xeFKWdZmEdz
         VES/HO9ZZow7E1Idc71ZpY57AzsWSlBCY6z+81hBS7PXa1XehNr1uc/XmbgzLNKPLqKy
         /i/w==
X-Gm-Message-State: AOJu0YyK5+FltFjtvC3mieHzlyxwKowNAjGQnzF6ABSLILqelRg3NOdk
	PxpQcpEiQajNUAbbdD9vrNf0TXTweZID6loX7Jc2rDLvhdD5e872SRUgd7WWfXRAGxnKXidE/E1
	XD2KroluLSQK6SS/fUbFmKrvnWpaonGeTLjNohQsZeXZJ1TKh36+a1BeKfg0xi9LlyIWtuJo=
X-Gm-Gg: ASbGncsHvLZK4VurcLDxf295WUgaT20oVRSiKqdyuksWY9SHIT+QbWZ18Zk2Om85D0d
	OFLI8abkyVmsM7dOZP/9rr42BwXHnYMzazt2ANpFuWrS18NxputvqHTnQWdJV+SCIkDPBoxtlnA
	yXl0+uogWp+CCFJkbFq3W4IoCwRnv0n672B73xF9Ua6XQcW9boM9r6xsGYOjWy7wg9ok3BGVgPe
	H6ZSQoMhMltrsCUILDuyh8dIXygsyUW3riR0xWkJeNjxB/+AR2lVxMeavQXz9LBH574XYciYcCd
	6TZBpAQ29cX6UoDo3x1S7v39QwKTh/L83X6VnU2Z3SVOL5rbqg5MGwQT8JewelKD6t3iYFgqz4S
	+sE1tcJJh0wNimpAf+o7BUYN8z0Xuy6c=
X-Received: by 2002:a17:90b:4b06:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-33b513b2d70mr47376128a91.17.1760598368441;
        Thu, 16 Oct 2025 00:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2FGB28qxIHHs3MnJ+sRN8NK52KhRCa6YrTng1b90y6jkj/krE+YDhMBKjgil3CAcOX5BkLA==
X-Received: by 2002:a17:90b:4b06:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-33b513b2d70mr47376098a91.17.1760598368005;
        Thu, 16 Oct 2025 00:06:08 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb651942csm668416a91.4.2025.10.16.00.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:06:07 -0700 (PDT)
Message-ID: <2416fe97-3288-47b1-478d-088e81176b32@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 12:36:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: rename firmware binaries
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXyCR/4wzW6sQ/
 SrJ+x6WTIkKaYqqckKaLVdziMeMsWmYCMZsbtx72K/tQb6t0Uqnub1RXMS081w6kQVQ1AjYDHqK
 ifVSDg8sbV73AWR2EDdG+Oj1CsUBFp97BSaFk4Y97IFP3c+l4HZNfX+//I01ZHC+Kty0l76tbap
 Vf+CfxAGEPpnvXBhpYNfsVa3HwBsh+SUSaXUtJoffpEe+VCA067bllh24NDaStuQjJc+aXDXM2+
 EVQnK3oYDILRqUGVxVNBXFvpCql5/y1CSPzdfqNo5L6SRTb5OlhwB3gcBYf7vv10B9YpOR8F/gN
 zDWw7M7+lZmF85blFAuOdzstr+W3Y+nAc/MRzW49WybvXTdEglnnya828W7Me0AyragINZN3VIO
 zTrZ4V1tHcMDm8eG5/W7S7TUbhoP7A==
X-Proofpoint-GUID: 0rz5mhgRP6s9-cOz9vQcXHrvyNbSFeFy
X-Proofpoint-ORIG-GUID: 0rz5mhgRP6s9-cOz9vQcXHrvyNbSFeFy
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68f09961 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=K-rAtN8yx3SbwkEUgyEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

Hi,

The following changes since commit bd4d2bde91e121c5bc85e6950a374a2e0ed854ff:

  Merge branch 'intel/dmc/xe2lpd/2.29' into 'main' (2025-10-14 19:25:50 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-binary-rename

for you to fetch changes up to 001b17a12956aeb46a9346862d05731c134634bc:

  qcom: vpu: rename firmware binaries (2025-10-16 12:32:01 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: rename firmware binaries

 WHENCE                                     |   9 ++++++---
 qcom/vpu/{vpu30_p4.mbn => vpu30_p4_s7.mbn} | Bin
 qcom/vpu/{vpu33_p4.mbn => vpu33_p4_s7.mbn} | Bin
 qcom/vpu/{vpu35_p4.mbn => vpu35_p4_s7.mbn} | Bin
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename qcom/vpu/{vpu30_p4.mbn => vpu30_p4_s7.mbn} (100%)
 rename qcom/vpu/{vpu33_p4.mbn => vpu33_p4_s7.mbn} (100%)
 rename qcom/vpu/{vpu35_p4.mbn => vpu35_p4_s7.mbn} (100%)

Thanks,
Dikshita
