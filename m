Return-Path: <SRS0=KGMS=AA=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E4D2FECF
	for <linux-firmware@archiver.kernel.org>; Tue, 27 Jan 2026 18:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABD81C16AAE; Tue, 27 Jan 2026 18:04:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72D1CC116C6
	for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 18:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72D1CC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFx0Iq1714647
	for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 18:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QVFvCbYDWuc9Uy4/cu59fE
	gOGvV+V4q1pRgPW41gc6c=; b=Wu2CaxlwPtwGU7jx4LETTa2xbPFQclY2GPd9OF
	oPy2bKq1wr46WVkA3VWYyt+o2Xg+3ggEUZiBl70EeORuGgFq5x3VqYd1VFCdEt82
	4O6RYZXtlr0GBM26TFs4oAwi81VPJhO8w1sCLJv6VevBqOYxaWPoCwMZbGjkLFf6
	gCzMgkFjAHPpEMKL76TzGoRzHIphz3oJ3zAOqrp0snxKuQwBvdiFVtxuGO3IjPjg
	lGBU76nldCzqxlckP8OgcXhm96w2BS91sraKzukOGVyF5oPLVq6IHGUxOTuEyjtj
	ghW4JoRux9nukEc6sDzdQhJrQiZsV7Xc9dnHlPFQn7SAjqCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g08fc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 18:04:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b799f7a603so952270eec.1
        for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 10:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769537088; x=1770141888; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=;
        b=Yt+Jn0YnR1jwU3OIhjnHDowcH3TcELua4nWkCn0RopU66hsqwOAL/GTluqgTGaWdzV
         L24/MloQxNViL7CmHkDZSdIHND49jJ00goIiPcc15L50EQgJ65l+Oft9QZPNLL+hhQaC
         BN+xAJG2Q0I/rTxi8GVmDb8oh4pBctNZP//r21RUtDfYi9Tj4cF+JcNhcOIi5f4GRlgm
         kC+DozCdWLHyRQ9wAL8I5IpvO9hgXiJuGP/8e9amcg0JNnB16gntkI3FtmF2iiTGucv7
         jdOEtE1F36I+J9zbPpr26raRPL/qyyyW7YY+pb6yZu8EitVqwN9bjzYV7PKtVl6a9vgE
         0I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537088; x=1770141888;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=;
        b=X/Dv9zY/aRtbQPS9dGfglMyLbGkSZvp4+kfMTFwHSDowj5dij8YiXDRF6ML+ITosmj
         +YrLwo+CYKU/YYFZr1tLemUBhP+yswWUFzSzJhN9B1pD6faeEJrJ/lCGPMlVr0AzbCvj
         gyyHt171OEXGBColnlDpIOhH2/11DtaYJnvTk43tcB66yNQG9Onprj9Kl+yrtkMg406z
         eLvtwU1v3LCCSIZ2uawHuCgfwYiJnXNdbOw83UsPISfi9vEc+Y+76+KCfSZYAxlOtSrA
         Tw/3Fe1JpCiqJ4y+6a4NvsgbcMAzyknidQVkoTiU2rLjYWWxRmYYUahhbUED0+rqGy9U
         oU/g==
X-Gm-Message-State: AOJu0YxLgCU3WQ9xaLNmUr8Cr9m/hT22m4KzZnw6JfNxeHQiQmZAhME5
	T9LoYnmcLD9wJwUFdRfhgydcihg2+we0T4RODy4vnAorD9ZZAa6jS5bR35+5i+wMCk3JzvqFWyR
	n//zCBl49FisxakXoX4zlG4J/G7YCKE5IA5nZEFBob/bCVKfwEBJUeJGRDNMifAzc0a3Imf8=
X-Gm-Gg: AZuq6aKdCodjgI5AJ7MWlEzbrerM5+Xuc1HriQtbor8kuVE7pRo/PhE7I8gYcOeVbTB
	OmUCQLfQuI9scpw5wsuwCmjqIn6DNjgam5lM4rqk7kz4fPDnE5AxZaJasa6VRsqhESIav9vr+ma
	FuEa2MKk0ESk9JCFEP01mBk4uZcNnbbpYZKT3WWXAIKAOgLO9DFL9NDkySLH6p5j3h2spqdpvie
	XIfGeMB/ASX7Tsz/iAzZfMEUC4Q45/9Sl4/bGnITrBEzDOjwTrQYBlDyuEU2j4hqj1bhfTVA5tM
	j8Q9jFAQT89miOEorjHLL84MlboR0Rv+ubam9Gvg8OWAopi0yY3fNgzwTs0pJ15iWY+lsVcxRlQ
	jp1uyHfMa/lKqxVNWO0kiOicCTwgKX9g2gaP8h+n4nIpbGQ==
X-Received: by 2002:a05:7300:e607:b0:2b7:3955:f51f with SMTP id 5a478bee46e88-2b78da13aecmr1907840eec.38.1769537088015;
        Tue, 27 Jan 2026 10:04:48 -0800 (PST)
X-Received: by 2002:a05:7300:e607:b0:2b7:3955:f51f with SMTP id 5a478bee46e88-2b78da13aecmr1907809eec.38.1769537087460;
        Tue, 27 Jan 2026 10:04:47 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c386590sm235612eec.3.2026.01.27.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:04:47 -0800 (PST)
Message-ID: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:04:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260127
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J5bZSRjg21LPkVoFjINSXDVEKo0Zz0Dn
X-Proofpoint-GUID: J5bZSRjg21LPkVoFjINSXDVEKo0Zz0Dn
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6978fe41 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=lktd8AmUIn0x_5DxP60A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0NyBTYWx0ZWRfX/9fDODL2leZC
 z2/PHTAU6zaqcgERB+y7ZsSWldrOpRWmbokRFzHKM6vfyJytC8QYYtp0dbUDav4btfQsfSJJsS+
 +Im6UBqOtjNUe7rw7vkdcelIO5DHkVI+2Qu4qi2Ck1JekXYb9RL0tnICcNXUk/hxUX31nB+SoE+
 9YtN07SmswxPnCvx6z4YV1QtR7Ss3aZ68FhcJmJhQa3AGU0iLFfn4Ls8AdHSmjumG77sgMG89sL
 Xw58u9wC1+KxzJTbtyxOxiu8rfu8NCMRmxufSkCeZrvMlbBbIatqFjAtQiS3syH1hmqIbkPkbXO
 d6uDXTZJxfmcNkn2Blb8+YJQe+31EdWRNNha7Hc9XAjRh2u7zzPympCA1jyWxlHEJoOj7PY51e6
 MN9xC63LrbHG4W00s+cPnM7QWf2DnptJmCNCWK+XgJ0++Y24oBB3wqmnoUc7yUEyQVzkAjVMLo2
 EiDkmhX7WSAkjKOSrFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270147

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k.

For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

For ath12k update firmware for QCN9274/hw2.0.

Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

  Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 19:26:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260127

for you to fetch changes up to 6bbca7605494e4a72b219c2d85a8026e8de3eef2:

  ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1 (2026-01-27 09:50:03 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

 WHENCE                              |   2 +-
 ath11k/QCA6698AQ/hw2.1/board-2.bin  | Bin 986384 -> 1046764 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 7056532 -> 7116936 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15183928 -> 16035896 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)
