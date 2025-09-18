Return-Path: <SRS0=mlDR=35=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68062CA1013
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 18:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3701CC4CEF1; Thu, 18 Sep 2025 18:17:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47AE7C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 18:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47AE7C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBSiAK029741
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 18:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=216aGmttavblAfmxtYmqgH
	fbJMwZU8PhIe6pQ5pZYfg=; b=jVgd9L0W5gAZ89DPwmreNCe5zZSls010LhK2SR
	nMs58oDeflAQFi4i1aBdIXMMxTOjSdlqaBLojisk7uaHtVw8UKWey8tmSZ9tl6d8
	zm84TPU9oaqmxPePF0gZ2dYnxj9G3+q08jR+ty6iVCqlyilb0AgdxqCfXcDj8liN
	ylDuwOpC+S2wtsp2JwfZuDZewiU883zD8C1a7+zJh5Sx+3Fz09n4m2twv22qytIx
	MXXtUY6or88Z+UMeaOE8G6kPVkunKXK/z2Tdv/wZiJmyawndMtOZI9u4Leb8wlP8
	Rn/TQJgqXMtUQJtzqTKEU188dEPSTxEUqNTwZE1nVYNZh9UQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0yffu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 18:17:37 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-75692bf211aso982353a34.3
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 11:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758219455; x=1758824255;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=216aGmttavblAfmxtYmqgHfbJMwZU8PhIe6pQ5pZYfg=;
        b=qjsNbOXElYFV0+gCRGfYq7LkCxijLiLfsCWdoF1zaFHfN9qwDk96DwqRVpU5Am06jT
         v/w2X0AeAxO7zyo6Aw+sJH3zCjuqyF4voGeAeJlsmaX39Up24vnW91MIzawjQcf0vgPj
         mZ/CT3m+mwsBZj0gKkOVlsBnI+TP0+e3I3oq37+iqkdSWYDYfjFSUHbTHVfrGn1m+ab3
         8zr8CoxglG+rwNnmHeiuN/G2tBR6uUG/YtRiL4rO4dJvmov6dEd6+1ednwEAHdtx8idC
         /K5yhhLcAslILsLoRJADpafacmIVcLNBhdK4paCE40ka2KhVdALTpwIVSNbBurFjJ4FU
         dyFw==
X-Gm-Message-State: AOJu0YyqqT/zDs6AK65EWRXakrgmDTNe8XjkiVh0aW7BXxlOedHNo0YC
	rfN48FQlvKj/hHlj+QnlvtrnmS5v9C9j2UfRNG9g6s9go41fxDxDRmNnMdAJbeHL0ZeGy1lxtG2
	NQAuv0IdutIBQBrSumNOz5LXBuLCJVLZbqOjRPyZ1tqFZekr8Cif2jiyIjn+X+SUd4b1vGds=
X-Gm-Gg: ASbGnctbalf/1y6RxHn8kBDxxzBag6DlH+D0ExkI0p/+Tz4Ae8OqL9/Fmj/oTixDB67
	JVK4h4UGub6NxoZ2KSRZdxYX19vuqGqKmxeR5C9zlUzCHABS45lcUkVN5qPv06ADeGsHv/N6s/C
	rN8U0R09M+wY5B3tIrSTO+faQs1dlycGbcoh0wPholqWoidhPQZAWdOLURNJs2Oaaefn6AGv/gP
	keroawtJPEJDqUvdjAzTzwD5m/WGawjR6hVnF5Qk8uY86iswTOTiKYRs53x80jN9mr9k1nTc5Tq
	/10g7C1cWilpu9iewAxM4HmrVLr52BulXsb5hotsia2IkgyKR1GKtbhMyrU0ely1IDo9MBv9CUp
	R
X-Received: by 2002:a17:902:d487:b0:269:96ee:17d3 with SMTP id d9443c01a7336-269ba523685mr4906305ad.51.1758218804917;
        Thu, 18 Sep 2025 11:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU8mGCWRPd+psvoKsiWXXqf6YywFbV+i/dLZiaG9yQ9bphtKe7TmqCheJxRks/sB6c9EPyDA==
X-Received: by 2002:a17:902:d487:b0:269:96ee:17d3 with SMTP id d9443c01a7336-269ba523685mr4905925ad.51.1758218804345;
        Thu, 18 Sep 2025 11:06:44 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de7a9sm31863505ad.80.2025.09.18.11.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:06:44 -0700 (PDT)
Message-ID: <9cadcd6a-5f99-4a2f-8aac-c612f355d82a@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 11:06:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath12k firmware ath-20250918
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C0xQuLZTvFU0Mwo4xLbtz3L-l9BOrK73
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cc4cc1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=payZvAD0jBNu81Yx7e0A:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: C0xQuLZTvFU0Mwo4xLbtz3L-l9BOrK73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1B6XkzCg0Dv3
 670HQUfYuHK7qlolVVD51GYaAYZYMMmpYR4Q8frl1Qz8VRqXf86rjPmXR3oiU6wl4c73yQIyIom
 d5DNRTtZow60oiTyuy/8LwcPfYihR+uZFncLfSV/wYcfuKvsaAYDJ/Pq3EZL2S0utnU/ZvxoTYE
 8tiyUlw5SKWmxf2flMK4yJ8zzoDt2iFY1ytZye16OrM/G4ssDMXSBBmiO8NsYlvsUDgu+TytOR8
 Wn9fatle+Pvjcw1+KaGeM2xfVEWC6p8fpDBziCe4Av2Rto6mczfH4veZ0MkdtweqLKWr3yssa2x
 IeJ18fsBnLBW+wAm3vMIV5dRep2FM7SEXa+R0CaWMJlP+gdo8rvNGAPCys0A7I1Iolhh9/iiJQ6
 NNVc1kqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

The following changes since commit 37f3f2d8e14cff7b316616924331d57f6ec6e259:

  Merge branch 'robot/patch-0-1758163077' into 'main' (2025-09-18 12:26:22 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250918

for you to fetch changes up to 1d588f106ceea113c4c650b43d948da5746e704c:

  ath12k: WCN7850 hw2.0: update board-2.bin (2025-09-18 11:03:58 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 2253732 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
