Return-Path: <SRS0=rZC2=AD=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB6E6BF37
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Jan 2026 20:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3576EC19425; Fri, 30 Jan 2026 20:29:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4412AC19421
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 20:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4412AC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJEfL32930189
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 20:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gKtVDmhXmolTIN8Uom22wN
	d+fElMtxvh9JofuLlixjA=; b=FQXCgx1ufEA3QJD4xNPENvAhS5CWK2fL9cmRCY
	XSRN6ftPFqE4mAph+/5oGAQWBg0G4dRgBg1B+oRwSnNVEQh2yll5Ql9g2607M02l
	kHnLjgjdZajf4Lo3VmC/35oywoJ6CjvCTfQSEgjODPBzZN6ra1yWX9Gs2V9IbeRv
	TBWL0NveMPnUHbADWAK2AE2xc2PE76m9AhoW2k2dMxrr83hLUGOtPW/VfYuO0l8b
	3ke7sLgfWH60olY6omWuLb9+WI52KcnMHvuFn8fFv4pMDh8/ZVfv4wN3kBTJX6MN
	Ea8x0+SEdhgM8Yy3sTpA0T0SSwbKeFZ3u5Qc8bYX5aVXNN8g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c12mmg748-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 20:29:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so17836503eec.0
        for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769804990; x=1770409790; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=;
        b=Ws6T4vPEUHTrqZmz3GaKMFiaJZFE78xEawMBVc+AopmcSE4lgtQONv5juLm6tF/RCp
         LW/5q7A3AFQ52ycmMig1xVTZDEPLp9HPZnb96nAgocGMUbGtpqUG7OZjLNMEjZsTg5E7
         CkVUBoreKeJXSyd42Xo5g7isuOtliUQ+1G02wpcHSA9iYjmsizzTvreaedXEfrXJxANW
         s8S+H4yJVJb+3PNEf61PZW3/bIOjH2K5A0ygqJGDQLvVBU248J3ZQLA5/8qmNeEAYz3x
         /hYJ+tD6Nv9kO+ySk1tZtpxTxSqlAN/D0P7qUEM2i9D3RaS+9XCwak63HGtZfOPjRRkT
         5kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804990; x=1770409790;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=;
        b=w1lv5SOC9vxCDcXDnBZB0qt+XUZSxwIWR+KDAz+qJEx4PxPivY84Ll/xeIIA1QV4TP
         PIz6UMilwMkGvUedWQMZywfdZ2CtgJin7iaVZFcs1CRLvvcdTkqzEd2KweUEeAKB3PEv
         JarBWZk3S4//zSyeU4ciRIb6eUOxKFiq2GfUMHPRhobKRw9Fbgpwu5ybwJiqmEV0ja5H
         ztInnXfpIpcpu0V4NB4gwuMmehkdR6McQow2wXwKbI82h/8aCAiznu9Og0brKdzy3Y8K
         mPgk9SnWqOmzRX3t3UYbVcK93+1D3Invm/291ulKRQ0WGtPENNrMfjSwDREZGMmyLxQZ
         PRmA==
X-Gm-Message-State: AOJu0Ywe94tyZIjZy5dF4hFKWlt6AQmfATogd0BldUpmBMre/2WM+qJ+
	UdsXtvE5UzD3gXxNbfM/Qzl/Ft25QesXup2xNM0k1fIGifma5mplVCe90IlRMf58wByCRyqUeYl
	R4n4wg/DIXC/gn5YUSANVpica66xSIbI9ZGZ73yJmkiJdSh8HH5gOeEOCgu4i2+a7GdFHJVc=
X-Gm-Gg: AZuq6aKLSjpYEAe7IgEGHjoxhqeAlYi30mKHAJ8ukvAHcDmukQqNmmCDEKQMOrk/nWS
	TOrPdc2T+B7VlQtaaZWb9ssF1DhpPoMS0EfWjakE/vnZBq4fIqxSXzbVj/e0N5oPiD9bKs2+4h1
	oBS7SGR/FyFkFHfmig8YpdYJT090NuE1is6oZHFv3qxmwyhmbjaNek/OcIzcZg894SlM7FXTkn9
	zohI6iKX2WJ83Cw4JMfuLO2mgAOP07+U9iZFSOguNKZgm9TwNgOs1xjQkh1oLDHGQMRi3FNW3yZ
	2wdCwjhVk5i0naOZkBoZR//JBFmcgyRqQ5uvkIeuQPva0Ksh54zAy897l//IabViJytrE8FjM+I
	iMkHjcShe01xAj3uZ+ChgLaYItUfZjNQILDwmapfRw27FZw==
X-Received: by 2002:a05:7300:4306:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b7c88ec6ddmr1953653eec.32.1769804989666;
        Fri, 30 Jan 2026 12:29:49 -0800 (PST)
X-Received: by 2002:a05:7300:4306:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b7c88ec6ddmr1953639eec.32.1769804989195;
        Fri, 30 Jan 2026 12:29:49 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm12595008eec.3.2026.01.30.12.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:29:48 -0800 (PST)
Message-ID: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260130
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uUeLg58vwnOJiKEZNM8aTHjCvS2knXxL
X-Proofpoint-ORIG-GUID: uUeLg58vwnOJiKEZNM8aTHjCvS2knXxL
X-Authority-Analysis: v=2.4 cv=fZKgCkQF c=1 sm=1 tr=0 ts=697d14bf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xtntLAz0KcNX19M1530A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2OCBTYWx0ZWRfX73dRaoFpTKC7
 oREpf7ICoShwwPsCNcm5s/tFcNBEg73YyDSTPEwEzX9sJGYVnnT0odyuOG1ffHal+bayxyMxmY0
 lYtIsH2d5B/K/mlI+KOFcPVX5y2lpYROLdi2Ygd7heyys5Pn3JccMWletydlRfc+HIfXTeqemPK
 U6qUUaIlyvCRt2eEvHkIz3yNAuktuvwggwRaCpOwk+dca18NkTZNHDFGCK15Gg5ttuJIJRW9KVk
 pd+GngRSnhkkUL6wmbEl7ZxqWlgkD2rpZlm8pxHJC116h64uAivJt9PUq37ltQvpQBOxoU6Seu7
 7TjtussgEZ/KOImFxVXBPbBzXlhEipHWXxICQAdMLsV1ZrzAOugZb5I/8+oHjHmr91GRC/zw16G
 4qSXkStnLO85CZnTAWXve+sWlLGcrr9JIz1yagXsmfjv1opj1x/ZXMsAFK1/mlKS33P92imcf2H
 vtqOh1xPC18cliRL3Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300168

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k.

For ath11k:

Update board file for QCA6698AQ/hw2.1 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

Update board file for WCN6855/hw2.0 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

For ath12k:

Update firmware for QCN9274/hw2.0.

Update board file for WCN7850/hw2.0 to support:
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255


Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

  Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 19:26:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260130

for you to fetch changes up to 09167289ec698099435e499e45c5788015d26783:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-01-30 12:17:30 -0800)

----------------------------------------------------------------
Jeff Johnson (4):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                              |   2 +-
 ath11k/QCA6698AQ/hw2.1/board-2.bin  | Bin 986384 -> 1046928 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 7056532 -> 7117076 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15183928 -> 16035896 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    | Bin 2253732 -> 2253964 bytes
 5 files changed, 1 insertion(+), 1 deletion(-)
