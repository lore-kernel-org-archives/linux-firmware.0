Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5E606A31B
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFIem0mR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIJP7iIp
Received: by smtp.kernel.org (Postfix)
	id CBD311F00A02; Wed,  4 Nov 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793799605;
	b=opz6ZEHIrB0TkTVNIF+Fk7GzZLWP3EXHJQ7IpPFRSvrFOHM7WhxP0LORWq5tuhKP4/2G
	 ksKzEWl5KkdBH6Fm3QTqOiz1rTAceScRVf5XBJO0izOrzvm7TMorhyxLvlptOLhgMakkA
	 +ZK98cqTG57LFw9WDqqrJd9uWc0t1hDQ/wP1ftBesZrrMakR1FI/eGRAWo3QczHj5agnT
	 z0kbaPKf3RoTKWs9mopyawPuU4quqkzv/3PMKO2CIyrkHsFUHoFpAosIhKVV2NcOKztZN
	 M8kZfoqA+rVDVKLb3oW+q0HZJ6DGHp+nduzmvHczzZdS/pMa3b0BQkYpDdOXdB6FjMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793799605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIT3swze0uxbJvgrXgfzFEtBoHxNvqouWeI4Hfi2HME=;
	b=TF5Xj4YLkf6RvNSjddhuSy47YnDz1My//Fs7+K0YJ6XwkpZwrYgL8ye9JGSLaKMYuoxb
	 pNIgPyGD81Xf/JUkMfjwD0xrOyS+8udgrZ+FEj79nGC9MUhjN0bNNVNVxZT3uh9PtLMp8
	 QJR1t9AqF3h/C4JIn37tcePFBkJdJa2JjO/1kCQ3dEdKKhqniC9ls5LSS27uppmJPeRKl
	 7X6zYRQcHDgBEDvJC8YF66ei6XkZQY8vpZuLRHtpp5Nk2mSgyicgdiyBWeSH6i+BzRjzq
	 A0YbKdV4vCalCDJqj4WT9n4aUxeej5BYRv9tF+tFvdDwKqPU5vPYtqS3gdN3TYACuyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFIem0mR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIJP7iIp;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2D181F00919
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFIem0mR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIJP7iIp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F2D181F00919
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo41T1387759
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 13:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIT3swze0uxbJvgrXgfzFE
	tBoHxNvqouWeI4Hfi2HME=; b=YFIem0mR3MeoNFUQwJOX0tNZKAdtLEYISijPDQ
	vSArsrZVXVO1egaO5+urISDmt7ZE3Uw//wyUKW6iqdwyldseBZjf0FZgvAlIrXsb
	e5AGb2u43sxkQw0ds6rAXyda1RSrkO7smunhnw7+f2vpmPVIjCtNlFpdfsKoDWVb
	y0GMDlitqyl0Fzl+SIQEptFKm4dTk1m7tYGPRMA5uzpPGgpZvvmNKz4Z6s1OCLeo
	cfsSGRqzGio9B/63p00psaQdLv6ZTaOU2JVKqvVH8NXpdPv3O2hkp4GFAsbytsHx
	sCIHU+hIOnuiZqPwg3Ms+crIaKQoEc98nSWfd08c2PJ7U8EQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsgabcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 13:40:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b057903778so20397b3a.1
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 05:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793799603; x=1794404403; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sIT3swze0uxbJvgrXgfzFEtBoHxNvqouWeI4Hfi2HME=;
        b=jIJP7iIpGLmi1bW1Hy8AFU7wFzXjiW/dePYp66KTT/5+yCOIN7JLN8cNeH/jCG9MiS
         VU7KjLc2vJBb/7Mi14r6rWEs0OhZGEcNvDcSg4ohiTSB0gXHEW9o2rbdwg0uAWqmXg8R
         OTSf+FKcod7lBB4tMwAl/j24A/58Azz1wjzCRPALaJUNRHHtgPQQJvrm0k796DqurYIX
         Z4UVm8k8E/4fig9XyE6P7OAJBI4aArMlRzqcTTxBBReKYKv+bmX72sm/V0mWgHv0vIw+
         uw9eK4pwPMgyIBE3rIiFmQEH0VVxJR09/QhgdvOPuOLpYC5NDXaGDjCXM0d7j7q6ao3e
         gvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799603; x=1794404403;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIT3swze0uxbJvgrXgfzFEtBoHxNvqouWeI4Hfi2HME=;
        b=orHyYrB/hKJGT3Cx7/rUee44yTVILMXVtutj9SV3khJJlgngI+ZflPec+8cDjkNXtV
         g2nl14tjKz0gxVfezTfK4nqYsXUc995hCU7VEKXwFqpX3h4QYZpvuJfHGGF1jnOaIjnA
         aO055kBezENLgpXg/j7rQyCHnQadi566mVS6MnaHcRUyXLtRZ/Oejmmf1+B/i4QkBuDw
         do8E3XeMLEVsOUChfjeoMCQMb0hY9Tzo7edow7d7khYTqN0vRH5pawkRjrJG/xZNCw6K
         prOjI+atxn8BHroUZuBRr/vq4JESSyfZfwU6RGtUWNZS13IbfBraXdurOdBJB8wp7xx1
         WEuQ==
X-Gm-Message-State: APuU4Z9Tqdj0HFXopYxeEVBtM1FZi2hXZlFXeNmwFt5BxCjh6JdOcOnl
	mzy3GHw2FtM3eM5biJm4qKNX34kH9Zx3J2wlxddRrm/NHunzUpySUOYXxz8gZoXwO1RTPkOGy/X
	lTcbsKDl0lDhF7ad9IuoboXI87g5O/9UGPnp6FzwYvO+zbtA8VeogkRADme3+TXaEqjC3+Ic=
X-Gm-Gg: AYBFou1D9i41Pjdgxa6LvVUGvQx3XyOUwhtwfjjSQ/MEgABAIfK1ISb2LP5Ik31sGQs
	CbXX/t3pVmCQlHUCRUO3GdS3mnW8P49XqflIezHzM4l6WLkTtPLDComqzUDlwdunR/oEhdDARWi
	BGHiH0RFr7d4HN0IUVQYWSNRepZWaMaJxHwrlTLyfeO/8UqU5uk80ntwMxaGaCa3BRMSaGXnqXE
	Gy6cA5ksHcYa/FO1zaXdTyNby5opf5NQBRxbJfXfZTmo3+o8Md8OrP0K2JJm19YIgzhxRmBXq4w
	o/IoYVVjyqGR9no/kJ2z+eYDcVHE6eZP5pI25pSyOMH8hIMTOI1dbput+xOyQpgLG81h40J69z8
	2M9W/mqOq2M9YJpp7fphbxQr4qKIzXn7W2RtEUBq0VtwBbAHM4OUUgsPjBYAKseT2OUSt9Vrkwz
	K0NQB9b/BVT9tpvfd+gt7EG9rMg+L8mPUMyBP41Q==
X-Received: by 2002:aa7:8faf:0:b0:8a0:8832:7b51 with SMTP id d2e1a72fcca58-8a9b7916588mr16758212b3a.0.1793799602321;
        Wed, 04 Nov 2026 05:40:02 -0800 (PST)
X-Received: by 2002:aa7:8faf:0:b0:8a0:8832:7b51 with SMTP id d2e1a72fcca58-8a9b7916588mr16758173b3a.0.1793799601647;
        Wed, 04 Nov 2026 05:40:01 -0800 (PST)
Received: from [10.249.10.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc082sm942839b3a.12.2026.11.04.05.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:40:01 -0800 (PST)
Message-ID: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:39:58 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [GIT PULL] Bluetooth firmware for Qualcomm QCC2072
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb35b3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=OGX8qOZm_7NW176EewwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: leGjDyr8A3MIB-nVqe9an2a8J44hVjd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NCBTYWx0ZWRfXzy9WCSd6DPcW
 fw5vCLg/sOibwR3VbxJuuVFJpraeE4sHk3JmrsBMwWE2LJ8+yUXQ1R96CEeUFMTRCo2Ka1igIBD
 pkbgjTVRaC8cMnkKHDJWhpLU7OInMq9c914fUILmNiAPIv2pXhd8SbTMBxiheyjYLmmIT4FORpZ
 jO3QNWalnSYp1HduESZwzT8rWjy8EM+ZINJfRsVsKEc7esNHZvQS0vze4BLbgYlGChv4RSXDm0D
 08iU+FkCLYVRks+BwfZmSyqfjz2TzAXZNnm0MHQUm65FdADEZcRi7rD1oBOecaVd/5YqFAiOtsF
 aD9yTv5fbmhto/lrQ43EWu9zXiK8ZEujBO1efyWyxeP3YfhCOWoKGr6K2VOV+793wL7MbOjlFHb
 ijoCWwyN1SWQRVXeH1lQrYhtk1pIk72L245bz6hxmiFt43vj+IzisTf9w2OgISxbkuFiKU7E0E9
 M6ac2sZOiNvqVSbVkQA==
X-Proofpoint-GUID: leGjDyr8A3MIB-nVqe9an2a8J44hVjd_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NCBTYWx0ZWRfX6sXhYXPtFJPk
 uSdnjhlepfv2eOOznnMm6ppgM7qyic90DlgEa5bWp7UOT1qtZbjRdaDu5GM03yxrWdjf9QZJOt/
 3Jj1cer44UTZjVpGQ7T/sOF5op5CH1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040054
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi linux-firmware maintainers,

Please pull the following linux-firmware update for Qualcomm
multi-subsystem QCC2072 btusb support.

The following changes since commit 0cb5a7fb037ef9489deaa4ebecd78b40fe7c07c6:

  Merge branch 'Dell_ISH_FW_582.7822.0' into 'main' (2026-11-04 01:33:35 +0000)

are available in the Git repository at:

  https://github.com/zijuhu/qca_btfw.git btusb_qcc2072

for you to fetch changes up to 79b0c4d9010f97e79322830461843bbb2740613e:

  Bluetooth: btusb: Add firmware for Qualcomm multi-subsystem QCC2072 (2026-11-04 13:51:32 +0100)

----------------------------------------------------------------
Zijun Hu (1):
      Bluetooth: btusb: Add firmware for Qualcomm multi-subsystem QCC2072

 WHENCE                                    |  47 +++++++++++++++++++++++++++++++++++++++++++++++
 qca/QCC2072/nvm_usb_00200101.bin          | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0002.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0006.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0008.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_000f.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0011.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0013.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_001a.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_001c.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_001e.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_001f.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0021.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0022.bin     | Bin 0 -> 10990 bytes
 qca/QCC2072/nvm_usb_00200101_0201.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0601.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0604.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0605.bin     | Bin 0 -> 11006 bytes
 qca/QCC2072/nvm_usb_00200101_0606.bin     | Bin 0 -> 10990 bytes
 qca/QCC2072/perinvm_usb_00220100.bin      | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0002.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0006.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0008.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_000f.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0011.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0013.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_001e.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_001f.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0021.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0022.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0201.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0601.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0604.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0605.bin | Bin 0 -> 498 bytes
 qca/QCC2072/perinvm_usb_00220100_0606.bin | Bin 0 -> 498 bytes
 qca/QCC2072/peripatch_usb_00220100.bin    | Bin 0 -> 7772 bytes
 qca/QCC2072/rampatch_usb_00200101.bin     | Bin 0 -> 247475 bytes
 37 files changed, 47 insertions(+)
 create mode 100644 qca/QCC2072/nvm_usb_00200101.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0002.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0006.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0008.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_000f.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0011.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0013.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_001a.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_001c.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_001e.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_001f.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0021.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0022.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0201.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0601.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0604.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0605.bin
 create mode 100644 qca/QCC2072/nvm_usb_00200101_0606.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0002.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0006.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0008.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_000f.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0011.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0013.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_001e.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_001f.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0021.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0022.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0201.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0601.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0604.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0605.bin
 create mode 100644 qca/QCC2072/perinvm_usb_00220100_0606.bin
 create mode 100644 qca/QCC2072/peripatch_usb_00220100.bin
 create mode 100644 qca/QCC2072/rampatch_usb_00200101.bin
