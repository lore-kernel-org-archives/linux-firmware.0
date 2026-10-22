Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D504606A319
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Oct 2026 02:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GAMJJ8aP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTx98g0r
Received: by smtp.kernel.org (Postfix)
	id 87D021F000C2; Thu, 22 Oct 2026 02:24:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792635840;
	b=dpSdArf9gVG9CrkchBLKO6yLUfUEg8luNlEZAZ3q7AwRNHah27Nlqc9xMck7J3XUK+3V
	 VUEoYv+Wi+VdLvI/8RYYppa+i5kbbnVM/S2iKMmroLodjipVDkU48jydI7I4lcP5+qUc7
	 yL8OWLb5wQThLGJnSqEpihgqVCWFB0zpaL+X2M5/ufMoL4h/pEGl2L3ndM347Z++Mh0VV
	 REHcbJ1eXPh1AbBhQONBz038T7eaimKfUxOpt9kKcU5eAp4+vyYH1s490ugNrG6bSscca
	 /AGrVKx6Ss1dvgob9q1VNoMh9DiWrsBNZFKd9Xg8SK6UCgn3OgCBb7tCqeAGLtI84BA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792635840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yLOsGg8iYANMMXUNkffIm6gpau1N4iMifAUOVRo+aac=;
	b=lDkOn5i4hnM417XdS8xQ2lFbA9dDxzOBwS5pUBdeCGq5guWAjvBUK3YUZ+YhosRSw2hv
	 cz5GeeF4uV1RGVHYZZygGKiia9Ur7SkTNfekweiMmkFwA8JluKG3NKvwkCO8efbopWYQk
	 VMLcMlPXEsF380b0FewlOBhgDuR+iDqwI3Cmyxp+qGSryZGkrN3vnh430xc0iqhEOsmj3
	 kUApfHtj4gNRRYBrJknF6/iZBaK5DotnF2YgQk9uBMn4EMm68cdOaVoXeSKe31hGvjrzt
	 fCKLsVitpifh68BsXyyCAVcikJFIXB8whqTQROXhGm9uL/LY7eG9+Ic2J2VUgdQvgVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GAMJJ8aP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTx98g0r;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC94A1F000C1
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 02:23:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GAMJJ8aP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTx98g0r
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CC94A1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M23pOj2945823
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 02:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yLOsGg8iYANMMXUNkffIm6
	gpau1N4iMifAUOVRo+aac=; b=GAMJJ8aPFMGvU63q9vodxIETsn+5TUuBRD0j1u
	zieN3oFI5lb4SVfyGXXb4Ow/0OVQEY2ZBfPha7o1LGSOcazKpD8+e3qCSUf3J2Xa
	7SZLXBnlSSRoSeUWFhHZqFp6tYKHnhSu7rSW/4mwjGenL0T62WoleZxKQwART7jw
	O9617D5I3m3bi+BYKg1QOHG3Vm36BE7AKQ2FFPPVLrQZS9Gs7ROx5aAz3LFlSrUr
	dS3BgrfRgdykZa5W6NbrSK5629LTwyS4QuuSxkzPreuCv1VXWpzacdikBiZtbu1n
	X9/D7UHJ1G9CpcuGU3cKNA9q7jOA60nYam3S4euRsrlT6bKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c871f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 02:23:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso190945685a.2
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 19:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792635838; x=1793240638; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLOsGg8iYANMMXUNkffIm6gpau1N4iMifAUOVRo+aac=;
        b=dTx98g0rg33TnS+eGk4i8CGUGMOh63HmAopHXJrEKkXkZKXo9v2qy4f9o+d7Aeu+oz
         k6t7y9L6ZPs2+/KMHF25rrOPe2aoHOogkBuJZXqfdgSLUbCQjnd7wSVipOBLmenJaLil
         e14eRBm4lik3ubXhv8k5Vh/rZ0d1DikjKYjnHao5Jd/WEtalnJ1J8n8n2QL2nznO3vxF
         uGf2divxrAp//GJzAA9plo3jpJcTuoaa7GtTW98wQZ8YJQXLKmXdBpIf/layX5EJedpC
         0HvHrcL1sTz6oqM4gssdgd72OuqmjFgqSNKK6olac7GXbF95Sl8kJS1yQ+2jpkBNyx4E
         Vv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635838; x=1793240638;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLOsGg8iYANMMXUNkffIm6gpau1N4iMifAUOVRo+aac=;
        b=BWlNp0sGE2bOOrJPOR1J8EvxvYa84QGaWq+L99qo51rJfa8WV8zJZXMSeDeC7j+y2W
         +oPH/VywiypK6hl04MzH3e50+4nejTLigdEo65jrMof5fbVD64uKbA4JUlpExslblOqD
         vixMDyDQQCWGexGJv0jUL3ob5xom0FFWrD1lJf7ROfArztEO4RvnwH00yqCYYjThN6oL
         lyMFHLzyMeiZIoNyYJl/nWG1CfyIPBCt+LY4C4c+1lBFFQrJwmuqGV0P6YWZs47ZsoZz
         jxF3NoJlvR9cEQqz/+1sYOWAGvdwBED50p4kj0CsnbHxNe0/YqswPsa5buBWthU3rARP
         PAaQ==
X-Gm-Message-State: AFq9FYIlKejyjcazicW6FEsHT4Wfqwjt8mUV1LbGDYXc+WtXS7+lv8eX
	rNhDEFaMm2z8oV+9PvgjEFAue7L2I0GtQZ16o94YSAqf3Eh5RWvEhGWw2iYVF1gnW8s/flup8u8
	aD9CO7iptyg1pBT+/9Ua8F3dZifWMvyNSiv3qmr67PrkLgEceDbX/l04crhVtE7k2abK9xac=
X-Gm-Gg: AYBFou0K+qJU6lT1iTXIqzsmZDrj1NgfgEKVEos3Ls8tXyxAa3eIxZkhFHPH4zI7ggV
	Vi7ZBtP8TiuXoKrQdY3xAL2mMwPdQzclRJe/MeG1lSbFo9WWx8iC386deMvJxlJM+fpkDgnzLl+
	Cevq2fTooLyijkr/utrzock2PLb1kulWO1h2VAd/YyF2Du0fvEfn3C8Rd0K9ZMdew33zaw+fVKP
	LHHFLPhDOkBwilDOfJXIF8b1RUEz5HcLygW4iG8GmewGvAP6gcTw7KmnPLURNBt3q85CaubEAnM
	IABEDRZgjXrAsAy3hp9ONuxYKj9cRq9NSRj+kvOUdlcx6AYvGJDKiq+cqCVZo1cQO8MSbYbtfJl
	JYddcF33iOd+FmpGCBUu+TRA21F5Xm4MRygX5pLll6ISV1nen/CaNmxyTjws=
X-Received: by 2002:a05:620a:7102:b0:93f:43a4:a477 with SMTP id af79cd13be357-93f57f7c7b4mr716370185a.32.1792635837801;
        Wed, 21 Oct 2026 19:23:57 -0700 (PDT)
X-Received: by 2002:a05:620a:7102:b0:93f:43a4:a477 with SMTP id af79cd13be357-93f57f7c7b4mr716368085a.32.1792635837187;
        Wed, 21 Oct 2026 19:23:57 -0700 (PDT)
Received: from [10.111.174.166] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e1db54sm402314985a.36.2026.10.21.19.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:23:56 -0700 (PDT)
Message-ID: <ebc0d9eb-033b-43e8-869c-7fabb7f870c4@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:23:52 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
Subject: [PATCH v2] QCA: Update Bluetooth QCA2066 firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwOSBTYWx0ZWRfX3/S/EP9HEOha
 VIS2OBK3XXTjzR0WfY2ll+BkxNZlnjbZ5efrnNLIUMdGnaMrrZ/nzU3R8hl1i8LKVLkSKlm0gNZ
 Vk4QkmvVXN/ESh+8DgJSWwOkDeCSDyA=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad973be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=hSzXBS32NSHQHUhTZ3kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Kh_707Q0FXz3G8q3ilBgU41aZye5OVgU
X-Proofpoint-ORIG-GUID: Kh_707Q0FXz3G8q3ilBgU41aZye5OVgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwOSBTYWx0ZWRfXzcjd8U4SXhMn
 HA9isd4sNi16RPh5EF6PGaCSaG+M/mB720qztPMVYxzliHk3a0Ru6GD9+b76aHnsSQt3zviEMf+
 QN2lyzwBKP3xF874abnPx1/rH0d4OMo/sDLEzJof1JK+yEIIZP9GLOklDaTCohPh13i7gsTLSHV
 8yi4ERCOB4qItYRty5eJeSMsL2t6Ryi6XHeJfzK9h+1jxFSntgoy1/EMbvMIrgLWlWCmlaJs1vB
 GftkOgTJjpMap3MD9w4i5H0yQ45EDR1Q/L0oWDDd80yF+NCkfQvToURRek+IaLwnxEtK+yQcyGl
 w5ggxVkOKi8URldT0UfcIO1HXDVP1EOprQG1ZMnO6W7F+B31Vo4WT8mjVufBugdgrDrIRfdex+4
 C6sym4RI+7GJxKrM6RzlBt+PNOthOTrpfBC7dFlhTSrxCinLPprjWQcD2bgsgdzbuUxBBhISaJh
 yEUlHuMTH0KRyv6KFBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220009
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any 
problems.

The following changes since commit 0147e35076c2d44a21eea0402351b99d5d1028b2:

   Merge branch 'robot/pr-0-1792610646' into 'main' (2026-10-21 21:36:35 
+0000)

are available in the Git repository at:

   https://github.com/jinwli-qc/linux-firmware.git update_QCA2066

for you to fetch changes up to aabc8408b89705e3b185cc8369114320b058fd4a:

   QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680 (2026-10-22 
10:17:59 +0800)

----------------------------------------------------------------
Jinwang Li (2):
       WHENCE: fix version string for QCA2066 firmware
       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680

  WHENCE                                   |   4 ++--
  qca/QCA2066/nvm_usb_00130201_030a.bin    | Bin 6917 -> 6917 bytes
  qca/QCA2066/nvm_usb_00130201_gf_030a.bin | Bin 6749 -> 6749 bytes
  qca/QCA2066/rampatch_usb_00130201.bin    | Bin 160124 -> 163332 bytes
  4 files changed, 2 insertions(+), 2 deletions(-)

Thanks,
Jinwang
