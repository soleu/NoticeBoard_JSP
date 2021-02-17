package User;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

public class UserDAO {
	private UserDAO() {
	};

	private static UserDAO dao = new UserDAO();

	public static UserDAO getInstance() {
		return dao;
	}

	private ArrayList<UserDTO> userList = new ArrayList();

	String fileName = "userdata.txt";
	public String realpath = "";
	public static boolean loginstate=false;

	public ArrayList<UserDTO> getuserList() {
		return userList;
	}

	public void insertUser(UserDTO user) {
		userList.add(user);
		saveData();
	}

	public boolean checkId(String id) {
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).getId().equals(id)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean checkIdPw(String id,String pw) {
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).getId().equals(id)) {
				if(userList.get(i).getPw().equals(pw)) {return true;}
			}
		}
		return false;
	}

	public void loadData() {
		File file = new File(realpath + fileName);
		if (file.exists()) {
			try {
				FileReader fr = new FileReader(file);
				BufferedReader br = new BufferedReader(fr);
				while (true) {
					String line = br.readLine();
					if (line == null) {
						break;
					}
					String[] temp = line.split("/");
					UserDTO tempUser = new UserDTO();
					tempUser.setUser(temp[0], temp[1], temp[2], temp[3]);
					userList.add(tempUser);
				}
				br.close();
				fr.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("파일없음");
		}
	}

	public void saveData() {
		String data = "";
		for (UserDTO temp : userList) {
			data += temp.getId();
			data += "/";
			data += temp.getPw();
			data += "/";
			data += temp.getName();
			data += "/";
			data += temp.getStartDate();
			data += "\r\n";// 윈도우 줄바꿈
		}
		try {
			FileWriter fw = new FileWriter(realpath + fileName);
			fw.write(data);
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
