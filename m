Return-Path: <SRS0=lox6=EE=oss.qualcomm.com=dishank.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3C9CD8C92
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jun 2026 09:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E020C1F00898; Mon,  8 Jun 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780910703;
	b=GTko2YEkmOmSTAvcevY3jxa04CbgIQi7kDWmhJSaOjvzGpAUfoREQDpUQLf5O3qacJvl
	 m8NoV4RllKkqRimY3efPhtuMm2rS8eu9l66c9yRST/qIgDWmHBGSlLV7p0wBo9s8xiFcl
	 w68S6vaDKhvnguvN3KbqNca+m6K0W7K/KaN7RSokW3fCBTfF3PHWMhRiGK8Eckg3+PExJ
	 MR+AsZeDQ73GLkWNO4sL8vGklCL68OOf6Mw9EnRQyLAuRCd/eaKzc9hltZkcI+FW6U/oW
	 v6048COHLwJTFOSLSRHudfA8zX1G22pLPipz5vnpit8S/XsMhrw4R3kk2+ERM5jfMPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780910703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Content-Type:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:From:List-Id:To:Cc:Subject:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=36uOLiNnPaohyKNfEOMVSBSEs/C1g9/is0BWJ+2T3vk=;
	b=twWXejqyo3EWHmymECbWxmDyPgM7Xlo6yhffEWhhgXnMfNDVzCMXgVSOP3wu9nD/vkmU
	 zRcFXgVE8wrnkto5YgCZk3qqFaBvKzr+12InOf12VDW6ishwVxibemlTkcCKHunkSQ8Rp
	 KGn4OGXg9+ovN7VC07DcK0FbFPCtnqDrDCUiVYS3A3HrP0VCaVHEinAuMRcBVLW9V7iag
	 KcIDXmj7YxwlENmgwyxSnJyD4kmYF1TB9EtKimV9JRWuSNs7u5gR4Otmk5eH/78YAMUk2
	 DO5TM29oXBD9zSY6Z6vAfqrkGrTNAmAkfIUQAeVec/Frg3f7BK8UAjTI9wX/XR4JnWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VcqJv8Ek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYnD2TeB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5150E1F00893
	for <linux-firmware@kernel.org>; Mon,  8 Jun 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VcqJv8Ek;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYnD2TeB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5150E1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkEX2347122
	for <linux-firmware@kernel.org>; Mon, 8 Jun 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=36uOLiNnPaohyKNfEOMVSBSEs/C1g9/is0BWJ+2T3vk=; b=Vc
	qJv8Ekd2HYrMtfobjB7orgzUpcEzPkO4TC6tYZQ7GhYPt1M7frr8I7f0fKE74TTe
	pLN7cVIaXbrO/xgEgPJcgMw0mIpsrEiji2orwszSbMKx5RAL7eKg8VlJtxSxlurK
	FQG3rH/D9KJCLY8E25I3Pk2CneQwSTZPEja7Gdli+QXyLZsN7rwj1nTdu1WSXA5i
	7t5qOvefCKJfsw5mtY0AbK2PjRrB0ejki3qNmWVtGLpLiK0bWJ8nLZPaa1NGPkho
	KMfgkLpCGOvHMWo2E2j6BnYxm5TbYBieZ4DfEGMFQ29+1QfXTnMSTUDGxSTO+s8z
	v8CNorn2CDBkvNlR/i5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrfb6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 08 Jun 2026 09:25:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso44298345ad.2
        for <linux-firmware@kernel.org>; Mon, 08 Jun 2026 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910702; x=1781515502; darn=kernel.org;
        h=subject:cc:to:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=36uOLiNnPaohyKNfEOMVSBSEs/C1g9/is0BWJ+2T3vk=;
        b=OYnD2TeBONCuvJotDpTstYOd7zGveOl9TcCtowzcBXjF5qe8njIc9DdKYu4LEverGe
         3PNis/36SgNhivDn3pvmSiKOPpKuYnDcFE0VxtXC5vmYN9Da4wUgXWiyd1ryjTY2nzQo
         BFhhwj0Oh4/4MgU2D6BSFtDEidOOMdHLbMEew75ZT3jtDIQuq50eYKZ1+g/IB7smK7jy
         bVx+svEvwM+mN2XtaUXgAUjAmbypww5khv/I2/bq5qv8bAvI9zb6v/fisWijWcQjvzaK
         XAxX0Ju9lW7Sn2dkB03MnkI5a/ckZePuLnBj7yKFxHQFdOO8pmQQSbA2iqrjG0AjxSN4
         UNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910702; x=1781515502;
        h=subject:cc:to:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36uOLiNnPaohyKNfEOMVSBSEs/C1g9/is0BWJ+2T3vk=;
        b=pMbqrWyxgWCudDI4+N+eK8zTZFo9EgBwrId7U80yqkNwG+0cUDehzVcj4W1Xu0HOWE
         IC+fcoOb3HELomq17Vp1tqyNqCq5zdSDdOBFTZAJnVHMRQigHJiV8KF5oShOCmcLFCaV
         CDqXGs/B8ZmMn8UtgziWFiEAGLotQzVu8EdZzc/q/aqPL+tN7UB0k3v55yVzOa5KagLh
         mPewYavZvc/driO/buBmhzEgGnyOcgdf/H85xv5xSQCIM7oMtiLbFjLtNg+MqaZq3DkE
         NxSQ/oxoEHD0xGaOT/Kk5bgkvx5PihRbIkRuu33eGWEdOdxFee3Kli66x4NtaWUTGtPS
         OFVA==
X-Gm-Message-State: AOJu0YyGPfJo8FMSCvj/Rb6K7h0WOcjBRydO1jJVINrEUc3dGfUfeG76
	EZ2c3w8/7dCH6V+JukqHsFUAPqR4wagLTt33Mk7qKIa7f+D7iMENH8oEd8ucOlbJ/AWDG8CeAW+
	7tlBTKxpemF7sR1PQ/d+q6I5nBiPG1R2lUzOwm+hjdB4G+kr0YOBsTZ6XVD0W8PjM/308sY8=
X-Gm-Gg: Acq92OEw3ODS1Ipz6aP+85KC4LB+/q8/PPVM08OzRnrZVUHAO5D9IH3X7KenQzAr8m3
	AalwLPv0tv8VgSXOT7dy7z0jM6YygX9G7cAPNz6E+GULhK2BJEwtfREFjLvJ/PMGEs+EtzJzNBD
	hXqaF3avdA1oDXauQGL+QhvV5KdVDiRb9FjxVAFFfZbWXBAZqij8WYQzHLZB3qyGAUAccc8Z2pB
	Nm6kQidy+VZRA4JyH7yZKPCkT2WAZG3cfzEpEhWGKueIMuBYOqs431UaKTOSciWQ8zVZkTdtYq7
	fa0xf5qYIgc93bdQrZWDvWnsgk2hFHKnIf5CDluQdRJrvm6ToYkgNrWKXEVXjwTuxRXwuQTu8rt
	fgDq2HNgzKPzCgA5VRqxkxwB3KvVi3dYAEEmmFMgFMrOQ00wpUaMRo1fM/qM=
X-Received: by 2002:a17:902:ebc6:b0:2c0:b081:849a with SMTP id d9443c01a7336-2c1e80ed7e0mr160365795ad.30.1780910701789;
        Mon, 08 Jun 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2c0:b081:849a with SMTP id d9443c01a7336-2c1e80ed7e0mr160365435ad.30.1780910701206;
        Mon, 08 Jun 2026 02:25:01 -0700 (PDT)
Received: from [10.219.1.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm184531505ad.27.2026.06.08.02.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:25:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------04wXB3clt6Ud2xE6YbxphaNy"
Message-ID: <fd56f9ec-cda5-4d04-8eb2-d25016a476be@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 14:54:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Dishank Garg <dishank.garg@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: hbandi@qti.qualcomm.com, dbaryshkov@gmail.com, mohamull@qti.qualcomm.com,
        samana@qti.qualcomm.com, ysiddu@qti.qualcomm.com,
        dishgarg@qti.qualcomm.com, harsnaga@qti.qualcomm.com
Subject: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to
 2.1.0-00669
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NyBTYWx0ZWRfX7UHFD2tN+OLa
 aargqMt2zKGYdfiaqr0mcbxNult4O3XN7U0VeTPbe9WkQwXLcJrR+2zv5LfZXQxHaQgVgCAtixv
 X4R6JL3puCQurr3oFPgfw6/ntefcZb0vz1oWYbwG4HnvVaq4RjUdEdCDUUdnYwx8+GmwcfmZpcF
 nUpRM3m16rjIUc7B+jdg5QoIt6LeCj7qdcwQRNAX0JUkIAGIC+llaR0g6oFeQw298I3mK8vwFLO
 dEb1466WzbQ8L6dnuu2z0PXXfL+0eq9TWD6r1is2ZIo3BuD4MS2E0ITQjjYzWTa3tI4uZUs3OM2
 1Y1U3e7qq/0siFGQ3j01OK0U2lcLeiFUWDBrXEgLRB3CS9hxs4rH8hle+oN3Wopjb/hR2oi2d+j
 /iMyt25ULsAv+wkjB/OZ4l0uK5oJourSw3w/KbDw+NmdlQHj8QYBoYW/4ZFF6A2WV4Au6Hox5gm
 JJ6l+7k6FbmSLzdqHiQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a268a6e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=p0WdMEafAAAA:8 a=B2wIhYwieFO2pfmhoSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYT6fcEvB48oxcYEAyIA:9 a=1VySb9RUEzU-WkoI:21 a=_W_S_7VecoQA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Vt6QIgkgePR9uW409O-Skn1yO9oBGyqY
X-Proofpoint-GUID: Vt6QIgkgePR9uW409O-Skn1yO9oBGyqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080087

This is a multi-part message in MIME format.
--------------04wXB3clt6Ud2xE6YbxphaNy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers,

Here's a pull request for Bluetooth Firmware. Please let us know if any 
issue is there.

The following changes since commit e9504bffad1f551d4e251f5fe184a16d86b3bb9d:

   Merge branch 'robot/pr-0-1780891185' into 'main' (2026-06-08 05:40:10 
+0000)

are available in the Git repository at:

https://gitlab.com/dishankgargoss/linux-firmware.git HEAD

for you to fetch changes up to 5118abf637cb6a5c9bb249cc6d897c537b6e653d:

   QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to 2.1.0-00669 
(2026-06-08 14:36:07 +0530)

----------------------------------------------------------------
Dishank Garg (1):
       QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to 2.1.0-00669

Merge-Request: QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to 
2.1.0-00669 (!1086) · Merge requests · kernel-firmware / Linux Firmware 
· GitLab 
<https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1086>

Thanks,
Dishank Garg

--------------04wXB3clt6Ud2xE6YbxphaNy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi linux-firmware maintainers,<br>
      <br>
      Here's a pull request for Bluetooth Firmware. Please let us know
      if any issue is there.<br>
      <br>
      The following changes since commit
      e9504bffad1f551d4e251f5fe184a16d86b3bb9d:<br>
      <br>
        Merge branch 'robot/pr-0-1780891185' into 'main' (2026-06-08
      05:40:10 +0000)<br>
      <br>
      are available in the Git repository at:<br>
      <br>
        <a class="moz-txt-link-freetext" href="https://gitlab.com/dishankgargoss/linux-firmware.git">https://gitlab.com/dishankgargoss/linux-firmware.git</a> HEAD<br>
      <br>
      for you to fetch changes up to
      5118abf637cb6a5c9bb249cc6d897c537b6e653d:<br>
      <br>
        QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to
      2.1.0-00669 (2026-06-08 14:36:07 +0530)<br>
      <br>
      ----------------------------------------------------------------<br>
      Dishank Garg (1):<br>
            QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to
      2.1.0-00669<br>
      <br>
      Merge-Request: <a
href="https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1086">QCA:
        Update Bluetooth WCN6856 firmware 2.1.0-00666 to 2.1.0-00669
        (!1086) · Merge requests · kernel-firmware / Linux Firmware ·
        GitLab</a><br>
      <br>
      Thanks,<br>
      Dishank Garg</p>
  </body>
</html>

--------------04wXB3clt6Ud2xE6YbxphaNy--
