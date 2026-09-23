Return-Path: <SRS0=tnHy=HP=oss.qualcomm.com=jinwang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CDBC982EA
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Sep 2026 06:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D2401F00899; Wed, 23 Sep 2026 06:03:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790143431;
	b=2H2V6iN/L95531ndXiz9VOpqXYrr33WbFFYFQmW73Tf3HFA1iCTvnk7zB3BpUOsEOjbe
	 V067vLlGyL1VO25ToFCevqwiyDvJZm0qn6fhdvS2u7T8LybNsC2u9oVYrFlYIj6G5kLS9
	 uRn0oPEOLjZwepbhE0eDTECUz3DtItyB2J2eKS7KvKH/kTgcBeFrl1+fBjWY430JGuRTl
	 3MySZei+iEfUPmwiaDYb/+HCfu99UdaDpP8OasESBcfDEHrPKYjxlYIFZAnLXQZaI+PEO
	 HLN7aCcFaoMq4yUVRICXdG6WGWzfUIWC22IQ2Yk0IIwYix3slJEuaYIYM7Zd3UrO1Mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790143431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K/pqWTaNSyZj+yRDKgWXspb1bEyVj5alRoYpFWz+l60=;
	b=jlITafXWto3RHM8fSY50oHcXL4g4N+OEPk3iYvLVBX1KcvuMwSpoJPnHE8dX6yM71g9S
	 5UOGSCgfqDOMPzDFbqBNK2yqUqeSm+AJkdxVFtR73HLcGDJoDQUfQmSJYSGHAysyoaxO4
	 XFMb1SevnocH6DAaek/HOuzcbH3S4fMZrPYEUTs+sq3AnfwIqQeDvA5Vj6m5jWhp8j/le
	 Eq7KBBBp9Z2UVS/ItJQQrXMuP/a0CY3rSeLV49nJLKkJhPG2q9USYkMwRxT7hgdm/kt5c
	 b0+9h6mhC8H4anSYaMay1ax3gNJYIzNmGNRWEP2cK+mqvWB5pT8ylxxyeCrXgxoneOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a89fvMXj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCk7l6TD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA77B1F00898
	for <linux-firmware@kernel.org>; Wed, 23 Sep 2026 06:03:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a89fvMXj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCk7l6TD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BA77B1F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iS8E1590640
	for <linux-firmware@kernel.org>; Wed, 23 Sep 2026 06:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K/pqWTaNSyZj+yRDKgWXsp
	b1bEyVj5alRoYpFWz+l60=; b=a89fvMXj8pEuiYRAg6qVStxku1GDMHAFWnj3xy
	AgEIoEUZ2/znNiMBJ6CL48Y9KKglt8dzBslsWVf0NN3sVFFgV12tT6Wpz4B8Fixi
	+hTyOjsT2h0VRMCg2hamhy0FSgMiQpt6LBnDYuU71zIEmsqM5tuP6G98lq/CqKbk
	4J6HS5ov5Y0g0AJAfqTz/MOYNmyz6bUV12QYIdcO6+ned6O/dTCrHKzb8JOG2Z6v
	AHcfzEzeKryswp7Wwfa5/jDvG5HgUMF5Qc1o48hc4Gm3dp0sxCW1O/lipjOhlXMo
	XEqejmX58DCsUb5ZywCWPxyjHn8uZe3M+DILZiaHzC/kNxJw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntcppw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 23 Sep 2026 06:03:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so621890eec.1
        for <linux-firmware@kernel.org>; Tue, 22 Sep 2026 23:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790143429; x=1790748229; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K/pqWTaNSyZj+yRDKgWXspb1bEyVj5alRoYpFWz+l60=;
        b=DCk7l6TDm8nNYCogWxrW1I0rZdIdRI+awtXFwi7/aTt6YZikt3LYgpYT4je425nGWf
         DeTrYSq+s22zCVfgIl1ckHd/rrc4N+iD3Klj0g59vBCvCMH15GGMWZJNHzgoIfHzFpz3
         +Au0D+ZJzBj/neq0NJKXaSG5EiuEBScJPiNzUEQfHa59wP11j/TYdXCoHcP960sPXVpa
         1RJaLDlZYa2A6/WG3FU4xxI1TLJUwo2O4OH3mE3lMtrNu94Jwzee0xcGyhNkNkHlUs1R
         aNKSeJE9Q2h7Pc7QKXNscvAqwBE+6zKWnemlS0kW2ttYPUCOvz0yk9AILcecD9QGz0Gq
         4+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143429; x=1790748229;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/pqWTaNSyZj+yRDKgWXspb1bEyVj5alRoYpFWz+l60=;
        b=wNPGwF3/KWX40oPtGHpZnPbE81yeuqRIy65sbFVQp2QgWOzba0H1tMKbxulROmPy9E
         UcyKu7xl/oAyUudq/Dg+MNEsckEzwmu8f9ahkTz2H3mwcXgznDMB8gKB6SSEOf1dZj6D
         3z1ai3RbuTyCJndDt+4G8Vsi+6UC5569ic7vxPsZKkxaPeM+8BfdHRCuN1OCja48bkpF
         I0aSSYzcAkJTWXS22dIYskVmC/bdrtatxJvkv1zO5hbP117t1022qrZ5qPOD0FhvO9lS
         NOzMdw8ESayuliDL8ajf1rFnhx/F3CdUOBGeaVP0rj565HJzb2/wb5DmO6/64WYLwGUb
         145A==
X-Gm-Message-State: AFuF++m4tqnFo0G++/FWCoyyhcySLnlHIVLGkcCzj+1H6X5BVmgNyaQA
	Znac5sn5B6X1LO9STCLx18KxXrXt12X9Cxx0QabfXTSpdpvFNfm/tvg621BSZLL9iK/bJN6Lfem
	ib1PUuwpSBfrKEoIBhaxEztWowyM75sCbK1AMgqg2bUY1Xc3ezfZhhoTKBuHNnWI5o+6v71U=
X-Gm-Gg: AYBFou3RPukKDL7QabDaxiqLPsshHeqKRr0dtyfqb0H1K9LvK2VKReIHddBaFqsLBss
	a3DdJEXtuBCZnI1bz+ZeSaOpWSD7hnuHlotSaG51AG+A5K6/gPQ+kWR4817ePtFdDrVuWgxHJgK
	dnp9Ig8iV6AtNteHM4OkqzZv6LtVln4q3ZooYUKBjX2zBZ4qgy//WNcU++Tlf8ZDVlC+7tp+t70
	NI8eiIFNF+77J0fTpazOGjN5iqnVeyyoMcTDerLq8sPhfzkQR/La2aGLFqEJeYpmMJHdULadGzb
	yfhS26KPYR1jNyCEXx7IgFNtEAKkjJb4yxYBh0j54TZbCL/gCqtT5IlYWrjAi1r+mofmoX9v+ap
	hJm8QrYLfC3wo8azmEPWbrw==
X-Received: by 2002:a05:693c:228f:b0:33c:3134:1055 with SMTP id 5a478bee46e88-33e8c53b899mr1524627eec.12.1790143428972;
        Tue, 22 Sep 2026 23:03:48 -0700 (PDT)
X-Received: by 2002:a05:693c:228f:b0:33c:3134:1055 with SMTP id 5a478bee46e88-33e8c53b899mr1524604eec.12.1790143428348;
        Tue, 22 Sep 2026 23:03:48 -0700 (PDT)
Received: from [10.239.97.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm3732497eec.0.2026.09.22.23.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 23:03:47 -0700 (PDT)
Message-ID: <2d324225-eea1-44ab-9c67-c362af99167a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:03:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
Subject: QCA: Update Bluetooth QCA2066 firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7vXMId9laKWbsmh5yG-vhjtZM7v7Ix1h
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab36bc5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=jLHNcmpLy5T2wQ3mu3sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfXyEr4LPs4veX8
 QtjwHPfSc0clTjMSpX5J+C8aifq9kgm+ffd+UIVLYFejaVAFwjS8yuk+9DtNRT8qLeU8DLSoW6u
 qDSZnSTh/x7IJoXnNQFcoD08aXW7wOp1QCqyPvXa/Cc7ksEu8WGIP9auWJpDykondy1ECb96qMH
 xum1icuhG7bQmDkWohYF9Z0xfHUXINF20Q33iz4vQuiU3/IXfFWC2UoknCaX81cwG+TWpyXkw8M
 ZJYUfQnI2e2qnrbUxdvkD2+Cy/Ax1lR+pMkkTiTh9uLMNwIqBkpcSI2jF+CIvFEWfiuHBHzAH0e
 DD3h6OMVATRSGOyNdYCYFBm5OxEWvbKn7kNGPtXCqN5YvRWr6Or3PlMsWgbMffzXObMI6h55zYk
 nNsD3YVxW0wA/yXi38Af3t9MyFomoOiqquXxnv3YU6Qim+03vxLnA2PpRzM+KAT98Oti0YGfuek
 TafzPV+wG2Nr6ylKJSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX1qgzxNtnOwAc
 15Bp5XNCe7pepVNxg4ERy2Ey+cuSor/rNeh/ngzDuw8usEih9+UQJxtQE27UldgL0j2+WAY6DUK
 0Wv8lFCGf05t2T/x4GUYIShgfMQ17kI=
X-Proofpoint-GUID: 7vXMId9laKWbsmh5yG-vhjtZM7v7Ix1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230023

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any problems.

The following changes since commit 797d34e622b2262ca0777e98fd40b1d29034169d:

   Merge branch 'robot/patch-0-1789972095' into 'main' (2026-09-21 
19:45:43 +0000)

are available in the Git repository at:

   git@github.com:jinwli-qc/linux-firmware.git update_QCA2066

for you to fetch changes up to 02fdb9b8c55ebb5cff080c01b3afbb66e1204746:

   QCA: Add QCA2066 Bluetooth firmware hpnv21g.30c (2026-09-23 13:49:02 
+0800)

----------------------------------------------------------------
Jinwang Li (2):
       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
       QCA: Add QCA2066 Bluetooth firmware hpnv21g.30c

  WHENCE           |   4 ++--
  qca/hpbtfw21.tlv | Bin 160124 -> 163332 bytes
  qca/hpnv21.301   | Bin 6876 -> 6876 bytes
  qca/hpnv21.302   | Bin 6876 -> 6876 bytes
  qca/hpnv21.309   | Bin 6884 -> 6884 bytes
  qca/hpnv21.30a   | Bin 6917 -> 6917 bytes
  qca/hpnv21.b10c  | Bin 6618 -> 6618 bytes
  qca/hpnv21.b111  | Bin 6618 -> 6618 bytes
  qca/hpnv21.b8c   | Bin 6610 -> 6610 bytes
  qca/hpnv21.b9f   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba0   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba1   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba2   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba3   | Bin 6618 -> 6618 bytes
  qca/hpnv21.ba4   | Bin 6618 -> 6618 bytes
  qca/hpnv21.baa   | Bin 6618 -> 6618 bytes
  qca/hpnv21.bb8   | Bin 6610 -> 6610 bytes
  qca/hpnv21.bin   | Bin 6610 -> 6610 bytes
  qca/hpnv21g.301  | Bin 6716 -> 6716 bytes
  qca/hpnv21g.302  | Bin 6716 -> 6716 bytes
  qca/hpnv21g.309  | Bin 6716 -> 6716 bytes
  qca/hpnv21g.30a  | Bin 6749 -> 6749 bytes
  qca/hpnv21g.30c  | Bin 0 -> 6458 bytes
  qca/hpnv21g.b10c | Bin 6458 -> 6458 bytes
  qca/hpnv21g.b111 | Bin 6458 -> 6458 bytes
  qca/hpnv21g.b8c  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.b9f  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba0  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba1  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba2  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba3  | Bin 6458 -> 6458 bytes
  qca/hpnv21g.ba4  | Bin 6458 -> 6458 bytes
  qca/hpnv21g.baa  | Bin 6458 -> 6458 bytes
  qca/hpnv21g.bb8  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.bin  | Bin 6450 -> 6450 bytes
  35 files changed, 2 insertions(+), 2 deletions(-)
  create mode 100644 qca/hpnv21g.30c

Thanks,
Jinwang
